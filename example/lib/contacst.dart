

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


final wizard={
    "display": "wizard",
    "settings": {
        "pdf": {
            "id": "1ec0f8ee-6685-5d98-a847-26f67b67d6f0",
            "src": "https://files.form.io/pdf/5692b91fd1028f01000407e3/file/1ec0f8ee-6685-5d98-a847-26f67b67d6f0"
        }
    },
    "components": [
        {
            "title": "Page 1",
            "label": "Page 1",
            "type": "panel",
            "key": "page1",
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
            "validate": {
                "required": true
            },
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
            "type": "button",
            "label": "Submit",
            "key": "submit",
            "disableOnInvalid": true,
            "input": true,
            "tableView": false
        }
     ],
            "input": false,
            "tableView": false
        },
        {
            "title": "Page 2",
            "label": "Page 2",
            "type": "panel",
            "key": "page2",
            "components": [
                {
                    "label": "Text Field",
                    "applyMaskOn": "change",
                    "tableView": true,
                    "validateWhenHidden": false,
                    "key": "textField10",
                    "type": "textfield",
                    "input": true
                }
            ],
            "input": false,
            "tableView": false
        }
    ]
};

final wizard2={
    "display": "wizard",
    "settings": {
        "pdf": {
            "id": "1ec0f8ee-6685-5d98-a847-26f67b67d6f0",
            "src": "https://files.form.io/pdf/5692b91fd1028f01000407e3/file/1ec0f8ee-6685-5d98-a847-26f67b67d6f0"
        }
    },
    "components": [
        {
            "title": "Page 1",
            "label": "Page 1",
            "type": "panel",
            "key": "page1",
            "components": [
                {
                    "label": "what is your name",
                    "applyMaskOn": "change",
                    "tableView": true,
                    "persistent": false,
                    "validate": {
                        "required": true
                    },
                    "validateWhenHidden": false,
                    "key": "name",
                    "type": "textfield",
                    "input": true
                },
                {
                    "label": "where do you life",
                    "applyMaskOn": "change",
                    "tableView": true,
                    "validateWhenHidden": false,
                    "key": "addresss",
                    "type": "textfield",
                    "input": true
                },
                {
                    "label": "Phone Number",
                    "applyMaskOn": "change",
                    "tableView": true,
                    "validateWhenHidden": false,
                    "key": "phone",
                    "type": "phoneNumber",
                    "input": true
                },
                {
                    "label": "Email",
                    "applyMaskOn": "change",
                    "tableView": true,
                    "validate": {
                        "required": true
                    },
                    "validateWhenHidden": false,
                    "key": "email",
                    "type": "email",
                    "input": true
                },
                {
                    "label": "Your Gender",
                    "optionsLabelPosition": "right",
                    "tableView": false,
                    "values": [
                        {
                            "label": "mail",
                            "value": "1",
                            "shortcut": ""
                        },
                        {
                            "label": "famile",
                            "value": "2",
                            "shortcut": ""
                        }
                    ],
                    "validateWhenHidden": false,
                    "key": "yourGender",
                    "type": "selectboxes",
                    "input": true,
                    "inputType": "checkbox"
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
                            }
                        ]
                    },
                    "validateWhenHidden": false,
                    "key": "educationalLevel",
                    "type": "select",
                    "input": true
                },
                {
                    "label": "Barth day",
                    "tableView": false,
                    "datePicker": {
                        "disableWeekends": false,
                        "disableWeekdays": false
                    },
                    "validate": {
                        "required": true
                    },
                    "enableMinDateInput": false,
                    "enableMaxDateInput": false,
                    "validateWhenHidden": false,
                    "key": "barthDay",
                    "type": "datetime",
                    "input": true,
                    "widget": {
                        "type": "calendar",
                        "displayInTimezone": "viewer",
                        "locale": "en",
                        "useLocaleSettings": false,
                        "allowInput": true,
                        "mode": "single",
                        "enableTime": true,
                        "noCalendar": false,
                        "format": "yyyy-MM-dd hh:mm a",
                        "hourIncrement": 1,
                        "minuteIncrement": 1,
                        "time_24hr": false,
                        "minDate": null,
                        "disableWeekends": false,
                        "disableWeekdays": false,
                        "maxDate": null
                    }
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
                }
            ],
            "input": false,
            "tableView": false
        },
        {
            "title": "Page 2",
            "label": "Page 2",
            "type": "panel",
            "key": "page2",
            "components": [
                {
                    "label": "favorite eate",
                    "applyMaskOn": "change",
                    "tableView": true,
                    "validateWhenHidden": false,
                    "key": "favoriteEate",
                    "type": "textfield",
                    "input": true
                },
                {
                    "label": "favorit color",
                    "applyMaskOn": "change",
                    "tableView": true,
                    "validateWhenHidden": false,
                    "key": "favoritColor",
                    "type": "textfield",
                    "input": true
                },
                {
                    "label": "testa",
                    "optionsLabelPosition": "right",
                    "inline": false,
                    "tableView": false,
                    "values": [
                        {
                            "label": "test",
                            "value": "test",
                            "shortcut": ""
                        },
                        {
                            "label": "test2",
                            "value": "test2",
                            "shortcut": ""
                        }
                    ],
                    "validateWhenHidden": false,
                    "key": "testa",
                    "type": "radio",
                    "input": true
                },
                {
                    "label": "Profile Url",
                    "applyMaskOn": "change",
                    "tableView": true,
                    "validateWhenHidden": false,
                    "key": "profileUrl",
                    "type": "url",
                    "input": true
                },
                {
                    "label": "Upload File",
                    "tableView": false,
                    "webcam": false,
                    "capture": false,
                    "fileTypes": [
                        {
                            "label": "",
                            "value": ""
                        }
                    ],
                    "validateWhenHidden": false,
                    "key": "uploadFile",
                    "type": "file",
                    "input": true
                }
            ],
            "input": false,
            "tableView": false
        }
    ]
};


final wizard3={
    "display": "wizard",
    "settings": {
        "pdf": {
            "id": "1ec0f8ee-6685-5d98-a847-26f67b67d6f0",
            "src": "https://files.form.io/pdf/5692b91fd1028f01000407e3/file/1ec0f8ee-6685-5d98-a847-26f67b67d6f0"
        }
    },
    "components": [
        {
            "title": "Page 1",
            "label": "Page 1",
            "type": "panel",
            "key": "page1",
            "components": [
                {
                    "label": "what is your name",
                    "applyMaskOn": "change",
                    "tableView": true,
                    "persistent": false,
                    "validate": {
                        "required": true
                    },
                    "validateWhenHidden": false,
                    "key": "name",
                    "type": "textfield",
                    "input": true
                },
                {
                    "label": "where do you life",
                    "applyMaskOn": "change",
                    "tableView": true,
                    "validateWhenHidden": false,
                    "key": "addresss",
                    "type": "textfield",
                    "input": true
                },
                {
                    "label": "Phone Number",
                    "applyMaskOn": "change",
                    "tableView": true,
                    "validateWhenHidden": false,
                    "key": "phone",
                    "type": "phoneNumber",
                    "input": true
                },
                {
                    "label": "Email",
                    "applyMaskOn": "change",
                    "tableView": true,
                    "validate": {
                        "required": true
                    },
                    "validateWhenHidden": false,
                    "key": "email",
                    "type": "email",
                    "input": true
                },
                {
                    "label": "Your Gender",
                    "optionsLabelPosition": "right",
                    "tableView": false,
                    "values": [
                        {
                            "label": "mail",
                            "value": "1",
                            "shortcut": ""
                        },
                        {
                            "label": "famile",
                            "value": "2",
                            "shortcut": ""
                        }
                    ],
                    "validateWhenHidden": false,
                    "key": "yourGender",
                    "type": "selectboxes",
                    "input": true,
                    "inputType": "checkbox"
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
                            }
                        ]
                    },
                    "validateWhenHidden": false,
                    "key": "educationalLevel",
                    "type": "select",
                    "input": true
                },
                {
                    "label": "Barth day",
                    "tableView": false,
                    "datePicker": {
                        "disableWeekends": false,
                        "disableWeekdays": false
                    },
                    "validate": {
                        "required": true
                    },
                    "enableMinDateInput": false,
                    "enableMaxDateInput": false,
                    "validateWhenHidden": false,
                    "key": "barthDay",
                    "type": "datetime",
                    "input": true,
                    "widget": {
                        "type": "calendar",
                        "displayInTimezone": "viewer",
                        "locale": "en",
                        "useLocaleSettings": false,
                        "allowInput": true,
                        "mode": "single",
                        "enableTime": true,
                        "noCalendar": false,
                        "format": "yyyy-MM-dd hh:mm a",
                        "hourIncrement": 1,
                        "minuteIncrement": 1,
                        "time_24hr": false,
                        "minDate": null,
                        "disableWeekends": false,
                        "disableWeekdays": false,
                        "maxDate": null
                    }
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
                }
            ],
            "input": false,
            "tableView": false
        },
        {
            "title": "Page 2",
            "label": "Page 2",
            "type": "panel",
            "key": "page2",
            "components": [
                {
                    "label": "favorite eate",
                    "applyMaskOn": "change",
                    "tableView": true,
                    "validateWhenHidden": false,
                    "key": "favoriteEate",
                    "type": "textfield",
                    "input": true
                },
                {
                    "label": "favorit color",
                    "applyMaskOn": "change",
                    "tableView": true,
                    "validateWhenHidden": false,
                    "key": "favoritColor",
                    "type": "textfield",
                    "input": true
                },
                {
                    "label": "testa",
                    "optionsLabelPosition": "right",
                    "inline": false,
                    "tableView": false,
                    "values": [
                        {
                            "label": "test",
                            "value": "test",
                            "shortcut": ""
                        },
                        {
                            "label": "test2",
                            "value": "test2",
                            "shortcut": ""
                        }
                    ],
                    "validateWhenHidden": false,
                    "key": "testa",
                    "type": "radio",
                    "input": true
                },
                {
                    "label": "Profile Url",
                    "applyMaskOn": "change",
                    "tableView": true,
                    "validateWhenHidden": false,
                    "key": "profileUrl",
                    "type": "url",
                    "input": true
                },
                {
                    "label": "Date / Time",
                    "format": "yyyy-MM-dd",
                    "tableView": false,
                    "datePicker": {
                        "disableWeekends": false,
                        "disableWeekdays": false
                    },
                    "enableTime": false,
                    "enableMinDateInput": false,
                    "enableMaxDateInput": false,
                    "validateWhenHidden": false,
                    "key": "dateTime",
                    "type": "datetime",
                    "input": true,
                    "widget": {
                        "type": "calendar",
                        "displayInTimezone": "viewer",
                        "locale": "en",
                        "useLocaleSettings": false,
                        "allowInput": true,
                        "mode": "single",
                        "enableTime": false,
                        "noCalendar": false,
                        "format": "yyyy-MM-dd",
                        "hourIncrement": 1,
                        "minuteIncrement": 1,
                        "time_24hr": false,
                        "minDate": null,
                        "disableWeekends": false,
                        "disableWeekdays": false,
                        "maxDate": null
                    }
                },
                   {
            "label": "Upload",
            "tableView": false,
            "storage": "url",
            "webcam": false,
            "capture": false,
            "fileTypes": [
                {
                    "label": "",
                    "value": ""
                }
            ],
            "validateWhenHidden": false,
            "key": "file",
            "type": "file",
            "input": true,
            "url": "Apload\\url"
        },
        {
            "label": "Upload",
            "tableView": false,
            "storage": "base64",
            "webcam": false,
            "capture": false,
            "fileTypes": [
                {
                    "label": "",
                    "value": ""
                }
            ],
            "validateWhenHidden": false,
            "key": "file1",
            "type": "file",
            "input": true
        }
            ],
            "input": false,
            "tableView": false
        }
    ]
};