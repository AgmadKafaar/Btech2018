# B.Tech 2018 - Final Year Project

Final Year Project for B.Tech: IT. This project builds a machine learning model to identify the probability of a neighbourhood becoming gentrified. The machine learning model is serialised into a binary file that is further used by an API to output the probability of a neighbourhood becoming gentrified.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

* [.NET Core](https://www.microsoft.com/net/download) - Development Framework
* [Nuget](https://www.nuget.org/)
* [Visual Studio Code](https://code.visualstudio.com/download) with C# packages installed.
OR
* [Visual Studio 2017 Community Edition](https://visualstudio.microsoft.com/downloads/)

### Installing

A step by step series of examples that tell you how to get a development environment running:

1. Restore Packages
2. Build Solution
3. Run BuildLearningModel project to build the serialised learning model file.
4. Copy the serialised file into the API's root directory

## Deployment

Add additional notes about how to deploy this on a live system:
* The API system can be deployed to a physical or virtual server on IIS, nginx or apache.
* The API can be deployed to an Infrastructure-As-A-Platform environment such as Azure, Google App Egine etc.
* The API can be containerised with Docker.

## Built With

* [Accord-net](http://accord-framework.net/) - The machine learning framework used
* [Nuget](https://www.nuget.org/) - Dependency Management
* [Visual Studio 2017 Community Edition](https://visualstudio.microsoft.com/downloads/) - IDE used

## Contributing

Please read [CONTRIBUTING.md](https://github.com/AgmadKafaar/Btech2018/blob/master/CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

[SemVer](http://semver.org/) is used for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

See the list of [contributors](https://github.com/AgmadKafaar/Btech2018/graphs/contributors) who participated in this project.

## License

This project is licensed under the GPL-3 License - see the [LICENSE.md](LICENSE) file for details

## Acknowledgments

* [Emily Royall](http://emilyroyall.com/) for her research into discovering gentrifying neighbourhoods using a data-driven technique.
* [César Souza](http://crsouza.com/) for open sourcing his machine learning framework for .net.
* [Prof. Olawande Daramola](https://sites.google.com/site/wandesnet/home) for his guidance throughout this project.
