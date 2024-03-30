#/bin/bash

pwd
export BUILD_USERNAME
export RHSM_USERNAME
export RHSM_PASSWORD
export VCENTER_ENVIRONMENT

if [ "$VCENTER_ENVIRONMENT" == "local" ]
then
    #### Register Red Hat Subscription Manager to enable updates. ###
    echo "> Registering Red Hat Subscription Manager to enable updates ...with" 
    subscription-manager register --username $RHSM_USERNAME --password $RHSM_PASSWORD
    sudo subscription-manager attach --auto
    sudo subscription-manager repos --enable=rhel-7-server-satellite-tools-6.7-rpms
    sudo subscription-manager repos --enable=rhel-server-rhscl-7-rpms
    sudo subscription-manager repos --enable=rhel-7-server-optional-rpms
    sudo subscription-manager repos --enable=rhel-7-server-ansible-2-rpms
    sudo subscription-manager repos --enable=rhel-7-server-extras-rpms
    sudo subscription-manager repos --enable=rhel-7-server-rpms
    sudo subscription-manager repos --enable=rhel-7-server-supplementary-rpms    
else
    # Copy the rhsm.conf file with the correct proxy values.
    echo "Copying rhsm.conf file with correct proxy settings for satellite"
    sudo cp /tmp/rhsm.conf /etc/rhsm/rhsm.conf

    echo "Retrieving katello satellite rpm"
    wget -e use_proxy=yes -e https_proxy=10.0.3.68:443 --no-check-certificate https://phx-mgt-lpsat3.intmgmt.com/pub/katello-ca-consumer-latest.noarch.rpm
    echo "Installing katello"
    sudo rpm -i ./katello-ca-consumer-latest.noarch.rpm
    echo "Enabling standard repos"
    #sudo subscription-manager register --org="PDC" --activationkey="mipc-prd-rhel7"
    sudo subscription-manager register --org="PDC" --activationkey="mipc-nprd-rhel7"
    sudo subscription-manager status 
    sudo subscription-manager attach --auto
    sudo subscription-manager repos --enable=rhel-7-server-satellite-tools-6.7-rpms
    sudo subscription-manager repos --enable=rhel-7-server-ansible-2-rpms
    sudo subscription-manager repos --enable=PDC_EPEL7_EPEL7_X86_64
    sudo subscription-manager repos --enable=rhel-7-server-rpms
    sudo subscription-manager repos --enable=rhel-7-server-supplementary-rpms
    sudo subscription-manager repos --enable=rhel-7-server-extras-rpms
fi

echo "Finished adding repos"
