title: How do you handle log files?
status: published
zendesk-id: 204338245
tags: [ log dataprotection ]

## Website logs

Website logs are logs files created by your websites, especially access and error logs. These logs are stored on the respective website's shared storage. We keep website logs uncompressed for the current month and compressed for another month. Older logs are deleted.

Since we consider website logs a part of your web application, we don't do any processing on them. If you are required to limit the storage of protected data (such as IP addresses), it is your responsibility to put appropriate measures in place to anonymise this data and/or to delete log files within the stipulated time frame. If you need assistance in implementing these measures, please contact our [support team](https://freistil.zendesk.com/hc/en-us/articles/201084645 "Technical support for freistilbox").


## System logs

System logs are log files created by the hosting infrastructure. These log files are necessary for operating the hosting infrastructure and are not available to customers. We keep system logs for a reasonable time, usually about two weeks. 

Protected data such as IP addresses stored in these log files is anonymised within 7 days.
