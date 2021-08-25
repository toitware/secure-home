# PubSub secure home example

The application will send messages on the `cloud:door/in` and print all message received on `cloud:door/out`.
Use the `smart-door.toit` program [here](https://github.com/toitware/secure-home/tree/main/level3/toit) to send replies back.

## Installation of Python and pip

First, install `pyhton3` and `pip3`

Option A: If you are on Windows, follow the setup guide [here](https://mothergeo-py.readthedocs.io/en/latest/development/how-to/venv-win.html).

Option B: On MacOS and Linux, follow the steps below:

Install `virtualenv`:

    pip3 install virtualenv

Then, setup and activate `virtualenv` for your project:

    virtualenv -p python3 env
    source env/bin/activate

## Dependencies

Next install dependencies:

```
$ pip install -r requirements.txt
```

Or in this case, where the only requirement is the toit-api, just run the install command with:

```
$ pip install toit-api==0.11.2
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

## API key

Create a new API key for your Toit project, by executing the Toit CLI command:

```
$ toit project api-keys add <name-of-key>
```

Example:

```
$ toit project api-keys add SecureHomeKey
```

View the list of API keys available in your project with the Toit CLI command:

```
$ toit project api-keys list
```

Note the ID of your API key.

View the generated API key secret with the Toit CLI command:

```
$ toit project api-keys print-secret <api-key-id>
```

Use the printed *secret* in the next step, when running the Python script.

## Run

Run the Python application with the choosen subscription name as arguments:

```
$ ./main.py <subscription-name>
```

Example:

```
$ ./main.py MyPubsubTopic
```

The program will prompt for the API key secret as input. Enter the secret, printed in the previous step.

While the Python application is running in one terminal window tab, run the Toit application `smart-door.toit` in another:

```
$ toit run -d <your-device> smart-door.toit
```

Example:

```
$ toit run -d MyDevice smart-door.toit
```

![animation](./dooropen.gif)
