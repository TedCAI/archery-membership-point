namespace :membership_score_policy do
  task import: :environment do
    MembershipScorePolicy.connection.execute <<~SQL
    INSERT INTO public.membership_score_policies (id, name, slug, score, created_at, updated_at) VALUES (1, '10米日榜第一名', '10m_daily_first', 3, '2017-10-09 00:00:00.000000', '2017-10-09 00:00:00.000000');
    INSERT INTO public.membership_score_policies (id, name, slug, score, created_at, updated_at) VALUES (2, '10米日榜第二名', '10m_daily_second', 2, '2017-10-09 00:00:00.000000', '2017-10-09 00:00:00.000000');
    INSERT INTO public.membership_score_policies (id, name, slug, score, created_at, updated_at) VALUES (3, '10米日榜第三名', '10m_daily_third', 1, '2017-10-09 00:00:00.000000', '2017-10-09 00:00:00.000000');
    INSERT INTO public.membership_score_policies (id, name, slug, score, created_at, updated_at) VALUES (4, '10米月榜第一名', '10m_monthly_first', 8, '2017-10-09 00:00:00.000000', '2017-10-09 00:00:00.000000');
    INSERT INTO public.membership_score_policies (id, name, slug, score, created_at, updated_at) VALUES (5, '10米月榜第二名', '10m_monthly_second', 6, '2017-10-09 00:00:00.000000', '2017-10-09 00:00:00.000000');
    INSERT INTO public.membership_score_policies (id, name, slug, score, created_at, updated_at) VALUES (6, '10米月榜第三名', '10m_monthly_third', 4, '2017-10-09 00:00:00.000000', '2017-10-09 00:00:00.000000');

    INSERT INTO public.membership_score_policies (id, name, slug, score, created_at, updated_at) VALUES (7, '18米日榜第一名', '18m_daily_first', 3, '2017-10-09 00:00:00.000000', '2017-10-09 00:00:00.000000');
    INSERT INTO public.membership_score_policies (id, name, slug, score, created_at, updated_at) VALUES (8, '18米日榜第二名', '18m_daily_second', 2, '2017-10-09 00:00:00.000000', '2017-10-09 00:00:00.000000');
    INSERT INTO public.membership_score_policies (id, name, slug, score, created_at, updated_at) VALUES (9, '18米日榜第三名', '18m_daily_third', 1, '2017-10-09 00:00:00.000000', '2017-10-09 00:00:00.000000');
    INSERT INTO public.membership_score_policies (id, name, slug, score, created_at, updated_at) VALUES (10, '18米月榜第一名', '18m_monthly_first', 8, '2017-10-09 00:00:00.000000', '2017-10-09 00:00:00.000000');
    INSERT INTO public.membership_score_policies (id, name, slug, score, created_at, updated_at) VALUES (11, '18米月榜第二名', '18m_monthly_second', 6, '2017-10-09 00:00:00.000000', '2017-10-09 00:00:00.000000');
    INSERT INTO public.membership_score_policies (id, name, slug, score, created_at, updated_at) VALUES (12, '18米月榜第三名', '18m_monthly_third', 4, '2017-10-09 00:00:00.000000', '2017-10-09 00:00:00.000000');

    INSERT INTO public.membership_score_policies (id, name, slug, score, created_at, updated_at) VALUES (13, '报道分', 'basic', 1, '2017-10-09 00:00:00.000000', '2017-10-09 00:00:00.000000');

    SQL
  end
end