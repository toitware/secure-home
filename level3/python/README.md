# PubSub secure home example

The application will send messages on the `cloud:door/in` and print all message received on `cloud:door/out`.
Use the `smart-door.toit` program to send replies back.

## Installation

First, install `pyhton3` and `pip3`, and then install `virtualenv`:

    pip3 install virtualenv

Then, setup and activate `virtualenv` for your project:

    virtualenv -p python3 env
    source env/bin/activate

Next install dependencies:

```
$ pip install -r requirements.txt
```

## Setup

In order to subscribe to a PubSub topic using the Toit API a subscription is needed.
The application will subscribe to `cloud:door/out` so we have to create a subscription for this:

```
$ toit pubsub subscription create cloud:door/out <subscription-name>
```

Example:

```
$ toit pubsub subscription create cloud:door/out MyPubsubTopic
```

## Run

Run the application with your toit username and password and the choosen subscription-name:

```
$ ./main.py <username> <password> <subscription-name>
```

Example:

```
$ ./main.py jacob@toit.io ******** MyPubsubTopic
```

While the python application is running in one terminal window tab, run the toit application in another:

```
$ toit run -d <your-device> smart-door.toit
```

![in out](http://g.recordit.co/mtDjYTbFQk.gif)
