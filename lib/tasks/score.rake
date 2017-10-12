namespace :score do
  task import: :environment do
    # 10米日榜 1,2,3
    # 18米日榜 7,8,9
    # 报道 13
    user = User.find_by(name: "ted")
    list = [
        # {time: "2017-08-19", score: [2, 7, 13]},
        # {time: "2017-08-20", score: [2,13]},
        # {time: "2017-08-22", score: [3,13]},
        {time: "2017-08-24", score: [1,13]},
        {time: "2017-08-25", score: [1,9,13]},
        {time: "2017-08-26", score: [2,13]},
        {time: "2017-08-27", score: [1,13]},
        {time: "2017-08-28", score: [1,7,13]},
        {time: "2017-08-30", score: [2,13]},
        {time: "2017-08-31", score: [1,9,13]},

        {time: "2017-09-01", score: [1,13]},
        {time: "2017-09-02", score: [3,9,13]},
        {time: "2017-09-03", score: [2,13]},
        {time: "2017-09-05", score: [2,13]},
        {time: "2017-09-06", score: [2,7,13]},
        {time: "2017-09-08", score: [13]},
        {time: "2017-09-09", score: [13]},
        {time: "2017-09-10", score: [13]},
        {time: "2017-09-11", score: [8,13]},
        {time: "2017-09-13", score: [13]},
        {time: "2017-09-14", score: [13]},
        {time: "2017-09-17", score: [3,9,13]},
        {time: "2017-09-18", score: [1,13]},
        {time: "2017-09-21", score: [2,13]},
        {time: "2017-09-22", score: [13]},
        {time: "2017-09-23", score: [8,13]},
        {time: "2017-09-24", score: [9,13]},
        {time: "2017-09-25", score: [2,8,13]},
        {time: "2017-09-26", score: [2,9,13]},
        {time: "2017-09-27", score: [8,13]},
        {time: "2017-09-30", score: [13]},

        {time: "2017-10-01", score: [2,8,13]},
        {time: "2017-10-02", score: [2,13]},
        {time: "2017-10-04", score: [2,13]},
        {time: "2017-10-05", score: [1,13]},
        {time: "2017-10-06", score: [1,7,13]},
        {time: "2017-10-07", score: [13]},
        {time: "2017-10-08", score: [2,8,13]},
        {time: "2017-10-10", score: [1,13]},
    ]

    list.each do |r|
      new_record = user.membership_records.create
      new_record.update(record_time: r[:time].to_time)
      r[:score].each do |s|
        new_record.membership_record_details.create(membership_score_policy_id: s)
      end
    end
  end
end