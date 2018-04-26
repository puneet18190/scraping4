task :import_data => :environment do
# require 'pry'
  require 'csv'
  csv_text = File.read('/home/puneet/Puneet/upwork/scrap_app2/public/data.csv')
  csv = CSV.parse(csv_text, :headers => true)
  arr=[]
  csv.each_with_index do |row,i|
    puts i
    # committee_type = row[0]
    # committee_id = row[1]
    # committee_name = row[2]
    # committee_status = row[3]
    # election_type = row[4]
    # registered_date = row[5]
    # amended_date = row[6]
    # chairperson_name = row[7]
    # chairperson_address = row[8]
    # treasurer_name = row[9]
    # treasurer_address = row[10]
    # candidate_name = row[11]
    # candidate_dob = row[12]
    # candidate_email = row[13]
    # candidate_address1 = row[14]
    # candidate_address2 = row[15]
    # candidate_pin = row[17]
    # candidate_address = "#{row[14]} #{row[15]} #{row[16]} #{row[17]}"
    # candidate_phone = row[18]
    # election_year = row[19]
    # office_type = row[21]
    # office_sought = row[22]
    # jurisdiction = row[23]
    # party = row[24]
    # link = "https://campaignfinancemd.us/Public/ShowReview?memberID=#{row[1].last(5).to_i}%20&memVersID=100%20&cTypeCode=01"

    id = row[0] #1807835.rcpt
    report_number = row[1] #100218469
    origin = row[2] #C3
    filer_id = row[3] #HUNTS 506
    type = row[4] #Candidate
    filer_name = row[5] #HUNT SAMUEL W
    first_name = row[6] #SAMUEL
    middle_initial = row[7] #W
    last_name = row[8] #HUNT
    office STATE = row[9] #REPRESENTATIVE
    legislative_district = row[10] #22
    position = row[11] #2
    party = row[12] #DEMOCRAT
    ballot_number = row[13] #"" 
    for_or_against = row[14] #""
    jurisdiction = row[15] #LEG DISTRICT 22 - HOUSE
    jurisdiction_county = row[16] #THURSTON 
    jurisdiction_type = row[17] #Legislative
    election_year = row[18] #2008
    amount = row[19] #$250.00
    cash_or_in_kind = row[20] #Cash
    receipt_date = row[21] #07/02/2007
    description = row[22] #""
    memo = row[23] #"" 
    primary_general = row[24] #Primary
    code = row[25] #Political Action Committee
    contributor_name = row[26] #SQUAXIN
    contributor_address = row[27] #10 SE SQUAXIN LN 
    contributor_city = row[28] #SHELTON
    contributor_state = row[29] #WA
    contributor_zip = row[30] #98584
    contributor_occupation = row[31] #"" 
    contributor_employer_name = row[32] #"" 
    contributor_employer_city = row[33] #"" 
    contributor_employer_state = row[34] #"" 
    url  = row[35] #View report (http =/row[0] #/web.pdc.wa.gov/rptimg/default.aspx?batchnumber=100218469)
    contributor_location = row[36] #(47.12187, -123.08012)

    if candidate_name.present?
      a=WashingtonCampaignFinanceCandidate.new
      a.state = 'Washington'
      a.full_name = candidate_name
      a.last_name = candidate_name.split(" ").first
      a.first_name = candidate_name.split(" ").last
      # a.party = party
      a.full_address = candidate_address
      a.phone = candidate_phone
      a.email = candidate_email
      a.save!

      b=WashingtonCampaignFinanceCommittee.new
      b.committee_name = committee_name
      b.committee_number = committee_id
      b.committee_type = committee_type
      b.committee_status = committee_status
      b.election_year = election_year
      b.candidate_id= a.id
      b.data_source_url = link
      b.data_source_state = 'Washington'
      b.office_sought = office_sought
      b.election_type = election_type
      b.register_data = registered_date
      b.amended_data = amended_date
      b.chair_name = chairperson_name
      b.chair_address = chairperson_address
      b.treasurer_name = treasurer_name
      b.treasurer_address = treasurer_address
      b.party = party
      b.save!
    end

    # c=WashingtonCampaignFinanceContributor.new
    # c.state = 'Washington'
    # c.job_title = ""
    # c.employer = contributor_detail
    # c.name = contributor
    # c.save!

    # d=WashingtonCampaignFinanceContribution.new
    # d.source_agency_org = 'Washington State Board of Election'
    # d.source_agency_id = '645584429'
    # d.date = date
    # d.amount = amount.to_f
    # d.committee_id = b.id 
    # d.contributor_id = c.id
    # d.type = schedule_2
    # d.type2 = schedule_1
    # d.save!
  end
end