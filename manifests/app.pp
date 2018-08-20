node 'node1'{

    include base
    class {'::tomcat':
        xms           => '60m',
        xmx           => '120m',
        user          => 'tomcat',
        group         => 'root',
        service_state => 'running'
    }
    
    tomcat::deploy { "sysfoo":
        deploy_url => 'https://2-144779801-gh.circle-artifacts.com/0/tmp/circle-artifacts.cIaDinX/sysfoo.war',
        checksum_value  => '3fb838238e99b25f8f082c51ada2b1c5',
    }
}

node default {

    notify { "******DEFAULT NODE *****": }
    
}

node 'node2'{

   include base
    class {'::tomcat':
        xms           => '70',
        xmx           => '130m',
        user          => 'tomcat',
        group         => 'tomcat',
        service_state => 'running'
    }

    tomcat::deploy { "sysfoo":
        deploy_url => 'https://2-144779801-gh.circle-artifacts.com/0/tmp/circle-artifacts.cIaDinX/sysfoo.war',
        checksum_value  => '3fb838238e99b25f8f082c51ada2b1c5',
    }

}