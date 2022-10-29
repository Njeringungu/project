puts "Seedind Admin data..."
admin = Admin.create(
    name: "Geoffrey",
    email: "geoffreyogembo06@gmail.com",
    password_digest: "donations@123"
)

puts "Seeding Charity..."

charities1 = Charity.create(
    name: "Maji Safi Foundation",
    description: "We address the urgency of clean, safe water for the communities we serve.  Within 1 month of your donation, thousands of students will have access to safe water - perhaps for the first time in their lives.",
    amount_donated: 1100000.54,
    category: 1,
    target_amount: 10000000.2,
    status: 0,
    email: "majisafi.foundation@gmail.com",
    password_digest: "password123"
)
charities2 = Charity.create(
    name: "A worthy Cause",
    description: "Let's help end Period Poverty for females globally in need. It's a bigger issue than just affordable access to pads and period underwear.",
    amount_donated: 6000000.50,
    category: 0,
    target_amount: 10000000.2,
    status: 0,
    email: "worthy.cause1@gmail.com",
    password_digest: "password123"
)
charities3 = Charity.create(
    name: "Save the Community",
    description: "Helping schools have clean pit latrines in Kenya",
    amount_donated: 950000.05,
    category: 2,
    target_amount: 10000000.2,
    status: 0,
    email: "save.community1@gmail.com",
    password_digest: "password123"
)
charities4 = Charity.create(
    name: "Mirror of Hope",
    description: "Mirror of Hope maintains a period bank in the community to provide a safe space to discuss menstrual health and hygiene and ensure a continous supply of sanitary towels to vulnerable girls.",
    amount_donated: 7000000.01,
    category: 0,
    target_amount: 10000000.2,
    status: 0,
    email: "mirror.hope@gmail.com",
    password_digest: "password123"
)
charities5 = Charity.create(
    name: "The Red Cresent",
    description: "You can help end the water crisis and restore hope. Together we'll provide access to clean, safe and reliable water across sub-Saharan Africa - one community at a time.",
    amount_donated: 5000000.00,
    category: 1,
    target_amount: 10000000.2,
    status: 0,
    email: "red.cresent@gmail.com",
    password_digest: "password123"
)
puts "Seeding Beneficiary..."

beneficiaries1 = Beneficiary.create!(
    name: "Namunyak",
    stories: "I got five washable pads. They gave me unimaginable comfort. I attended school without any worries. Unlike the rags, they are easy to wear. Besides, they are colourful and they don’t stink because they dry faster than pieces of cloth. I still use them today, almost a year after the floods",
    amount: 650000.60,
    image: "https://teachersupdates.co.ke/wp-content/uploads/2022/09/CBA-TALK-2022-09-15T071842.889-min.png",
    charity_id: 1 
)
beneficiaries2 = Beneficiary.create!(
    name: "Naserian",
    stories: "I can now play basketball, my favorite sport with no worries.",
    amount: 550000.01,
    image: "https://nmcdn.io/e186d21f8c7946a19faed23c3da2f0da/8ed2672177464f2e9b193130d1000c50/files/children-eating-4-copy-process-s700x562.png",
    charity_id: 2
)
beneficiaries3 = Beneficiary.create!(
    # water
    name: "Chebet",
    stories: "Thank you, I now access to clean water.",
    amount: 70000.88,
    image: "https://i0.wp.com/eaglenewsonline.com/wp-content/uploads/2020/03/Uganda-Girls-drawing-bathwtaer-scaled.jpg?fit=2048%2C969&ssl=1",
    charity_id: 4
)
beneficiaries4 = Beneficiary.create!(
    name: "Akinyi",
    stories: "The pads helped me stay in school.",
    amount: 100000.99,
    image: "https://educateachild.org/sites/default/files/styles/900/public/images/2016//GCN-Kenya-Large.jpg?itok=2db0Av5j",
    charity_id: 3
)
beneficiaries5 = Beneficiary.create!(
    # toilet
    name: "Halima",
    stories: "We know have access to clean toilets",
    amount: 855000.60,
    image: "https://media.globalcitizen.org/thumbnails/41/3e/413e8e38-35a6-44ef-9c0a-30a4cf612bc8/screen_shot_2019-09-03_at_52835_pm.png__1600x900_crop_subsampling-2.png",
    charity_id: 5
)

puts "Seeding Donor..."

donors1 = Donor.create(
    first_name: "oscar",
    last_name: "olouch",
    email: "oolouch@gmail.com",
    password_digest: "password123",
    reminder: "DateTime.new(2022,11,1,17)",

    mode_of_donation: "mpesa",

    status: 0,
    donate: 0   
)
donors2 = Donor.create(
    first_name: "lorain",
    last_name: "akinyi",
    email: "akinyil@gmail.com",
    password_digest: "password123",
    reminder: "DateTime.new(2022,11,1,17)",

    mode_of_donation: "mpesa",

   status: 0,
    donate: 0   
)
donors3 = Donor.create(
    first_name: "Janet",
    last_name: "Njeri",
    email: "janetn@gamil.com",
    password_digest: "password123",
    reminder: "DateTime.new(2022,11,1,17)",

    mode_of_donation: "mpesa",

   status: 0,
    donate: 1  
)
donors4 = Donor.create(
    first_name: "Geoffrey",
    last_name: "kenyansa",
    email: "kenyansag@gmail.com",
    password_digest: "password123",

    reminder: "DateTime.new(2022,11,1,17)",
    mode_of_donation: "mpesa",
   status: 0,

    donate: 1   
)
donors5 = Donor.create(
    first_name: "gladys",
    last_name: "ndichu",
    email: "ndichuglado@gmail.com",
    password_digest: "password123",
    reminder: "DateTime.new(2022,11,1,17)",

    mode_of_donation: "mpesa",

   status: 0,
    donate: 1   
)

puts "Seeding Donations..."
donations1 = Donation.create(
    donor_id: 5,
    charity_id: 3,
    amount: 1100000.54
)
donations2 = Donation.create(
    donor_id: 1,
    charity_id: 5,
    amount: 950000.05
)
donations3 = Donation.create(
    donor_id: 2,
    charity_id: 2,
    amount:  5000000.00
)
donations4 = Donation.create(
    donor_id: 4,
    charity_id: 1,
    amount: 6000000.50
)
donations5 = Donation.create(
    donor_id: 3,
    charity_id: 4,
    amount: 7000000.01
)

puts "Done seeding!"
