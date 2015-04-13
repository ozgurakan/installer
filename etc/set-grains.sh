
OPENSTACK_ID="devstack"

MYSQL_MASTER="server1"
MYSQL_SLAVE="server2"
MYSQL_CLUSTER_ID="mysql-cluster1"


##Setting MASTER SQL Grains##
if [ "$MYSQL_MASTER" != "" ]
then
salt $MYSQL_MASTER grains.setval openstack-id $OPENSTACK_ID
salt $MYSQL_MASTER grains.setval role mysql 
salt $MYSQL_MASTER grains.setval mysql-is-master true 
salt $MYSQL_MASTER grains.setval cluster-id $MYSQL_CLUSTER_ID
else
echo "MySQL Master is not Set"
fi


##Setting SLAVE SQL Grains##
if [ "$MYSQL_SLAVE" != "" ] 
then
salt $MYSQL_SLAVE grains.setval openstack-id $OPENSTACK_ID
salt $MYSQL_SLAVE grains.setval role mysql
salt $MYSQL_SLAVE grains.setval mysql-is-master false
salt $MYSQL_SLAVE grains.setval cluster-id $MYSQL_CLUSTER_ID
else
echo "MySQL Slave is not Set"
fi


