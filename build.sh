#/*-------------------------------------------*/
#/*                  run.sh                   */
#/*    Script usado para Rodar a aplicacao    */
#/*-------------------------------------------*/


#/*-------------------------------------------*/
#/*                 VARIAVEIS                 */
#/*-------------------------------------------*/

projeto="chess"
CATALINA_HOME="/usr/share/tomcat8"
CATALINA_BASE="/var/lib/tomcat8"


pass="025896"


echo \#/*\-\-\-\-\-\-\-\-\-\-\-\-\-----------------\-\-\-\-\-\-\-\-\-\-\-\-\-\-*/
echo \#/*\ \ \ \ \ \ \ \ \ \ \ \ \ PARANDO O TOMCAT\ \ \ \ \ \ \ \ \ \ \ \ \ \ */
echo \#/*\-\-\-\-\-\-\-\-\-\-\-\-\-----------------\-\-\-\-\-\-\-\-\-\-\-\-\-\-*/
echo $CATALINA_HOME/bin/catalina.sh stop
echo
echo $pass | sudo -S $CATALINA_HOME/bin/catalina.sh stop

#/*-------------------------------------------*/
#/*    Checkar se o projeto ja foi criado     */
#/*-------------------------------------------*/

if [ -d "$CATALINA_BASE/webapps/$projeto" ]
then

	echo \#/*\-\-\-\-\-\-\-\-\-\-------------------------\-\-\-\-\-\-\-\-\-*/
	echo \#/*\ \ \ \ \ \ \ \ \ \ DELETANDO ANTIGO PROJETO\ \ \ \ \ \ \ \ \ */
	echo \#/*\-\-\-\-\-\-\-\-\-\-------------------------\-\-\-\-\-\-\-\-\-*/


	echo comando: rm -r \$CATALINA_BASE/webapps/$projeto/*
	echo
	echo $pass | sudo -S rm -r $CATALINA_BASE/webapps/$projeto/*

	echo \#/*\-\-\-\-\-\-\-\-\-\-\---------------------\-\-\-\-\-\-\-\-\-\-\-\-*/
	echo \#/*\ \ \ \ \ \ \ \ \ \ \ CRIANDO NOVO PROJETO\ \ \ \ \ \ \ \ \ \ \ \ */
	echo \#/*\-\-\-\-\-\-\-\-\-\-\---------------------\-\-\-\-\-\-\-\-\-\-\-\-*/
	echo comando: cp -r ./* \$CATALINA_BASE/webapps/$projeto/
	echo
	echo $pass | sudo -S cp -r ./* $CATALINA_BASE/webapps/$projeto/

else

	echo \#/*\-\-\-\-\-\-\-\-\-\-\---------------------\-\-\-\-\-\-\-\-\-\-\-\-*/
	echo \#/*\ \ \ \ \ \ \ \ \ \ \ CRIANDO NOVO PROJETO\ \ \ \ \ \ \ \ \ \ \ \ */
	echo \#/*\-\-\-\-\-\-\-\-\-\-\---------------------\-\-\-\-\-\-\-\-\-\-\-\-*/

	echo comando: mkdir \$CATALINA_BASE/webapps/$projeto/
	echo
	echo $pass | sudo -S mkdir $CATALINA_BASE/webapps/$projeto/

fi


#/*-------------------------------------------*/
#/*           Finalizando script              */
#/*-------------------------------------------*/



echo \#/*\-\-\-\-\-\-\-\-\-\-\-\-\-----------------\-\-\-\-\-\-\-\-\-\-\-\-\-\-*/
echo \#/*\ \ \ \ \ \ \ \ \ \ \ \ \ INICIANDO TOMCAT\ \ \ \ \ \ \ \ \ \ \ \ \ \ */
echo \#/*\-\-\-\-\-\-\-\-\-\-\-\-\-----------------\-\-\-\-\-\-\-\-\-\-\-\-\-\-*/
echo $CATALINA_HOME/bin/catalina.sh start
echo
echo $pass | sudo -S $CATALINA_HOME/bin/catalina.sh run
