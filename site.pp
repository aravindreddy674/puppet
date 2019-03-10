node 'default' {
        include apache
}
node 'puppet-agent' {
#       include apache
        include config
        include java
}
