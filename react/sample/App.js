import React, { Component } from "react";
import logo from "./logo.svg";
import "./App.css";
import fetch from "node-fetch";

class App extends Component {
    constructor(props) {
        super(props);
        this.state = { 
			apiResponse: "",
			dbResponse: "" 
		     };
	var appName = process.env.REACT_APP_APPLICATION_NAME;
	if (appName === "") {
	    this.hostName = "localhost";
	} else {
	    var appSpace = process.env.REACT_APP_APPLICATION_NAMESPACE;
	    this.hostName = appName + "-api." + appSpace + ".svc.cluster.local";
	}
    }

    callAPI() {
	var url = "http://" + this.hostName + ":9000/testAPI";
        fetch(url, { cache: 'no-cache' })
            .then(res => res.text())
            .then(res => this.setState({ apiResponse: res }))
            .catch(err => { 
				this.setState({ apiResponse: "'" + err + "'" })
				console.error(err);
			  });
    }

    callDB() {
	var url = "http://" + this.hostName + ":9000/testDB";
        fetch(url, { cache: 'no-cache' })
            .then(res => res.text())
            .then(res => this.setState({ dbResponse: res }))
            .catch(err => { 
				this.setState({ dbResponse: "'" + err + "'" })
				console.error(err);
			  });
    }

    componentDidMount() {
        this.callAPI();
        this.callDB();
    }

    render() {
        return (
            <div className="App">
                <header className="App-header">
                    <img src={logo} className="App-logo" alt="logo" />
                    <h1 className="App-title">Welcome to React</h1>
                    <h2 className="App-host">Using {this.hostName}:9000</h2>
                </header>
                <p className="App-intro">{this.state.apiResponse}</p>
                <p className="App-intro">{this.state.dbResponse}</p>
            </div>
        );
    }
}

export default App;
