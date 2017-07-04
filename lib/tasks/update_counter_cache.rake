desc "Update counter caches"
task update_counter_cache: :environment do
  CounterCache.update(Question, :answers)
  CounterCache.update(User, :questions)
  CounterCache.update(Category, :questions)
end