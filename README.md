# form_io_builder

A new Flutter plugin project.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/to/develop-plugins),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

created by Abdulwahab Ahmed 
Flutter form_io_builder Library for Integration with Form.io

A powerful and easy-to-use Flutter library that allows you to integrate forms designed with Form.io into your Flutter applications. With this library, you can load forms in JSON format, display them dynamically, collect data entered by users, and then send it to any API or database according to your needs.

Key Features:

Easy integration with Form.io.
Dynamically display custom forms within Flutter applications.
Full support for data collection and sending it to any recipient.
Flexible and easy-to-customize interface.

## example json data
final form1={
    "display": "form",
    "settings": {
        "pdf": {
            "id": "1ec0f8ee-6685-5d98-a847-26f67b67d6f0",
            "src": "https://files.form.io/pdf/5692b91fd1028f01000407e3/file/1ec0f8ee-6685-5d98-a847-26f67b67d6f0"
        }
    },
    "components": [
        {
            "label": "what is your name",
            "applyMaskOn": "change",
            "tableView": true,
            "validate": {
                "required": true
            },
            "validateWhenHidden": false,
            "key": "whatIsYourName",
            "type": "textfield",
            "input": true
        },
        {
            "label": "How old are you ",
            "applyMaskOn": "change",
            "mask": false,
            "tableView": false,
            "delimiter": false,
            "requireDecimal": false,
            "inputFormat": "plain",
            "truncateMultipleSpaces": false,
            "validate": {
                "required": true
            },
            "validateWhenHidden": false,
            "key": "howOldAreYou",
            "type": "number",
            "input": true
        },
        {
            "label": "tell about your self",
            "applyMaskOn": "change",
            "autoExpand": false,
            "tableView": true,
            "validateWhenHidden": false,
            "key": "tellAboutYourSelf",
            "type": "textarea",
            "input": true
        },
        {
            "label": "Educational level",
            "widget": "choicesjs",
            "tableView": true,
            "data": {
                "values": [
                    {
                        "label": "Illiterate",
                        "value": "1"
                    },
                    {
                        "label": "Primary",
                        "value": "2"
                    },
                    {
                        "label": "Secondary",
                        "value": "3"
                    },
                    {
                        "label": "University",
                        "value": "4"
                    }
                ]
            },
            "validate": {
                "required": true
            },
            "validateWhenHidden": false,
            "key": "educationalLevel",
            "type": "select",
            "input": true
        },
        {
            "label": "Columns",
            "columns": [
                {
                    "components": [
                        {
                            "label": "Number Id",
                            "applyMaskOn": "change",
                            "mask": false,
                            "tableView": false,
                            "delimiter": false,
                            "requireDecimal": false,
                            "inputFormat": "plain",
                            "truncateMultipleSpaces": false,
                            "validateWhenHidden": false,
                            "key": "numberId",
                            "type": "number",
                            "input": true
                        }
                    ],
                    "width": 6,
                    "offset": 0,
                    "push": 0,
                    "pull": 0,
                    "size": "md",
                    "currentWidth": 6
                },
                {
                    "components": [
                        {
                            "label": "Password",
                            "applyMaskOn": "change",
                            "tableView": false,
                            "validateWhenHidden": false,
                            "key": "password",
                            "type": "password",
                            "input": true,
                            "protected": true
                        }
                    ],
                    "width": 6,
                    "offset": 0,
                    "push": 0,
                    "pull": 0,
                    "size": "md",
                    "currentWidth": 6
                }
            ],
            "key": "columns",
            "type": "columns",
            "input": false,
            "tableView": false
        },
       
        {
            "label": "Select",
            "widget": "choicesjs",
            "tableView": true,
            "multiple": true,
            "validate": {
                "required": true
            },
            "data": {
                "values": [
                    {
                        "label": "d",
                        "value": "d"
                    },
                    {
                        "label": "b",
                        "value": "b"
                    },
                    {
                        "label": "c",
                        "value": "c"
                    }
                ]
            },
            "validateWhenHidden": false,
            "key": "select666",
            "type": "select",
            "input": true
        },
         {
            "label": "Text Field",
            "applyMaskOn": "change",
            "tableView": true,
            "validate": {
                "required": true,
                "pattern": "r^9[0k]",
                "customMessage": "asddd",
                "minLength": 12,
                "maxLength": 12,
                "minWords": 2,
                "maxWords": 10
            },
            "validateWhenHidden": false,
            "key": "textField666",
            "type": "textfield",
            "input": true
        },
        {
            "type": "button",
            "label": "Submit",
            "key": "submit",
            "disableOnInvalid": true,
            "input": true,
            "tableView": false
        }
    ]
};


