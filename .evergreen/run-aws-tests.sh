# Preconditions
# - $DRIVERS_TOOLS is path to clone of git://github.com/mongodb-labs/drivers-evergreen-tools.git
# - $CDRIVER_BUILD is path to the build of mongo-c-driver (e.g. mongo-c-driver/cmake-build)
# - run from root of mongo-c-driver
# - MONGODB_BINARIES is path to mongodb binaries
# - IAM_AUTH_ECS_ACCOUNT and IAM_AUTH_ECS_SECRET_ACCESS_KEY are set to access key id/secret access key

# Disable tracing.
set +o xtrace
# Fail on the first command that errors.
set -o errexit

# Test regular credentials.
echo "DRIVERS_TOOLS=$DRIVERS_TOOLS"
echo "CDRIVER_BUILD=$CDRIVER_BUILD"
echo "MONGODB_BINARIES=$MONGODB_BINARIES"

# Set path so example-client can find dependencies
export INSTALL_DIR=$(pwd)/install-dir
. ./.evergreen/add-build-dirs-to-paths.sh

echo "===== Testing regular auth via URI ====="
# Create user on $external db.
cd $DRIVERS_TOOLS/.evergreen/auth_aws
$MONGODB_BINARIES/mongo --verbose aws_e2e_regular_aws.js
cd -

USERNAME_ENCODED=$(python3 -c "import urllib.parse; print(urllib.parse.quote('''$IAM_AUTH_ECS_ACCOUNT''', safe=''))")
PASSWORD_ENCODED=$(python3 -c "import urllib.parse; print(urllib.parse.quote('''$IAM_AUTH_ECS_SECRET_ACCESS_KEY''', safe=''))")

echo "Valid credentials - should succeed:"
$CDRIVER_BUILD/src/libmongoc/mongoc-ping "mongodb://$USERNAME_ENCODED:$PASSWORD_ENCODED@localhost/?authMechanism=MONGODB-AWS"

echo "Invalid credentials - should fail:"
if $CDRIVER_BUILD/src/libmongoc/mongoc-ping "mongodb://$USERNAME_ENCODED:bad_secret_access_key@localhost/?authMechanism=MONGODB-AWS"; then
    echo "Unexpected - authed but it should not have"
else
    echo "auth failed as expected"
fi

echo "===== Testing auth with session token via URI ====="
echo "TODO"
echo "===== Testing auth via environment variables ====="
echo "TODO"
echo "===== Testing auth via ECS task metadata ====="
echo "TODO"
echo "===== Testing auth via EC2 task metadata ====="
echo "TODO"