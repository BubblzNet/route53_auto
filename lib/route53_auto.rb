require "route53_auto/version"
require "ec2_switcher"

class Route53 < Switcher

  attr_accessor :client
  attr_accessor :r53

  def initialize(id, domain_name)
    super(id)
    puts "\nswitcher initialized" if @switcher
    @client = r53_client_connect
    puts 'Client auth successfull' if @client
    @r53 = auto_change(domain_name)
    puts 'r53 client auth successfull' if @r53
  end

  def r53_client_connect
    Aws::Route53::Client.new(region: @region, credentials: @credentials)
  end

  def reload
    @client = self.r53_client_connect
  end

  private

  def auto_change(domain_name)
    @client.change_resource_record_sets({
      hosted_zone_id: @client.list_hosted_zones[:hosted_zones][0][:id],
      change_batch: {
        changes: [{
          action: "UPSERT",
          resource_record_set: {
            name: domain_name,
            type: "CNAME",
            ttl: 60,
            resource_records: [{
              value: @ec2.public_dns_name
            }]
          }
        }]
      }
    })
  end

end
