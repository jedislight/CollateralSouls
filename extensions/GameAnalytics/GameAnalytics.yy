{
    "id": "58907e53-073e-4f80-80bd-f66c07b2b56c",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "GameAnalytics",
    "IncludedResources": [
        "Included Files\\GameAnalyticsSupportDLL.dll",
        "Scripts\\Analytics\\ga_create_default_annotations_map",
        "Scripts\\Analytics\\ga_generate_session_id",
        "Scripts\\Analytics\\ga_user_event",
        "Scripts\\Analytics\\ga_design_event",
        "Scripts\\Analytics\\ga_design_value_event",
        "Scripts\\Analytics\\ga_progression_start_event",
        "Scripts\\Analytics\\ga_progression_fail_event",
        "Scripts\\Analytics\\ga_progression_complete_event",
        "Scripts\\Analytics\\ga_session_end",
        "Scripts\\Analytics\\ga_queue_event"
    ],
    "androidPermissions": [
        
    ],
    "androidProps": false,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": -1,
    "date": "2019-37-08 07:05:48",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "6aab5513-8ed3-42c2-99ef-d4dbd7149878",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 17593107861742,
            "filename": "GameAnalyticsSupportDLL.dll",
            "final": "",
            "functions": [
                {
                    "id": "242d89c0-09ca-4fc1-b280-38d85ca990f5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "free_sha2",
                    "help": "ga_free_sha2(hash_to_free)",
                    "hidden": false,
                    "kind": 12,
                    "name": "ga_free_hmac_sha2",
                    "returnType": 2
                },
                {
                    "id": "b6a83dce-1dd2-40c2-a135-974a80fee005",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "create_hmac_sha2",
                    "help": "ga_create_hmac_sha2(key_string, to_hash_string)",
                    "hidden": false,
                    "kind": 12,
                    "name": "ga_create_hmac_sha2",
                    "returnType": 1
                }
            ],
            "init": "",
            "kind": 1,
            "order": [
                
            ],
            "origname": "extensions\\GameAnalyticsSupportDLL.dll",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": false,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosdelegatename": "",
    "iosplistinject": "",
    "license": "Free to use, also for commercial games.",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "",
    "productID": "",
    "sourcedir": "",
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": "",
    "tvosdelegatename": "",
    "tvosmaccompilerflags": "",
    "tvosmaclinkerflags": "",
    "tvosplistinject": "",
    "version": "1.0.0"
}