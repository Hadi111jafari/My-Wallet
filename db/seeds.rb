@user1 = User.create(name: "Ali", email: "ali@gmail.com", password: "123456", password_confirmation: "123456")
@user2 = User.create(name: "Mahdi", email: "mahdi@gmail.com", password: "123456", password_confirmation: "123456")

@group1 = Group.create(user_id: @user1.id, name: "Travel", icon: "✈️")
@group2 = Group.create(user_id: @user2.id, name: "Food", icon: "🍔")
@group3 = Group.create(user_id: @user1.id, name: "Study", icon: "📚")

@expense1 = Expense.create(user_id: @user1.id, name: "India", amount: 500)
@expense2 = Expense.create(user_id: @user1.id, name: "Bullani", amount: 10)
@expense3 = Expense.create(user_id: @user1.id, name: "America", amount: 10000)

@group_expense1 = GroupExpense.create(group_id:  @group1.id, expense_id: @expense1.id) 
@group_expense2 = GroupExpense.create(group_id:  @group2.id, expense_id: @expense2.id) 
@group_expense3 = GroupExpense.create(group_id:  @group1.id, expense_id: @expense3.id) 
