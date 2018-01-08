class LambdaContext(object):
    def __init__(self):
        self.aws_request_id = 'invokeid'
        self.log_group_name = 'AWS_LAMBDA_LOG_GROUP_NAME'
        self.log_stream_name = 'AWS_LAMBDA_LOG_STREAM_NAME'
        self.function_name = 'AWS_LAMBDA_FUNCTION_NAME'
        self.memory_limit_in_mb = 'AWS_LAMBDA_FUNCTION_MEMORY_SIZE'
        self.function_version = 'AWS_LAMBDA_FUNCTION_VERSION'
        self.invoked_function_arn = 'invoked_function_arn'

        self.client_context = None
        self.identity = None

    def get_remaining_time_in_millis(self):
        return 0

    def log(self, msg):
        print(msg)
