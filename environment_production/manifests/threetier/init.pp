
$vmdomain = {
        'fvRsDomAtt' => {
          'attributes' => {
            'tDn' => 'uni/vmmp-VMware/dom-aci-test-vc-1',
          },
        },
}

$webepg = {
        'fvAEPg' => {
          'attributes' => {
            'name'   => 'web',
          },
          'children'  => [
            $vmdomain,
            {
              'fvRsCons' => {
                'attributes' => {
                  'tnVzBrCPName' => 'app-contract',
                }
              }
            },
            {
              'fvRsProv' => {
                'attributes' => {
                  'tnVzBrCPName' => 'web-contract',
                }
              }
            }
          ]
        }
}

$appepg = {
        'fvAEPg' => {
          'attributes' => {
            'name'   => 'app',
          },
          'children'  => [
            $vmdomain,
            {
              'fvRsCons' => {
                'attributes' => {
                  'tnVzBrCPName' => 'db-contract',
                }
              },
            },
            {
              'fvRsProv' => {
                'attributes' => {
                  'tnVzBrCPName' => 'app-contract',
                }
              }
            }
          ]
        }
}

$dbepg = {
        'fvAEPg' => {
          'attributes' => {
            'name'   => 'db',
          },
          'children'  => [
            $vmdomain,
            {
              'fvRsProv' => {
                'attributes' => {
                  'tnVzBrCPName' => 'db-contract',
                }
              }
            }
          ]
        }
}

class threetier {
	apic { 'three-tier' :
    ensure      => 'present',
    address     => 'apic.aci.ceclab.info',
    config_type => 'hash',
    config      => {
      'fvAp' => {
        'attributes' => {
          'descr'     => 'My 3-tier app',
          'dn'        => 'uni/tn-puppet-test/ap-three-tier-app',
          'name'      => 'three-tier-app',
        },
        'children'  => [
          $webepg,
          $appepg,
          $dbepg
        ]
      },
    }
  }
}