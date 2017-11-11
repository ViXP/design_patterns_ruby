# The editorial office of local magazine has a lot of departments. Each
# department prepared its own article so the chief editor must decide in which
# order to assemble them and to declare the sequence of delivery of finished
# materials.
#
# REQUEST EditorialOrder
# RECEIVERS Department: SportsDepartment, NewsDepartment, CultureDepartment,
#                       InvestigationsDepartment, PrintDepartment

require './receivers'
require './request'

# Setting the chain of responsibilities:
InvestigationsDepartment.next_receiver = NewsDepartment
NewsDepartment.next_receiver = SportsDepartment
SportsDepartment.next_receiver = CultureDepartment
CultureDepartment.next_receiver = PrintDepartment
PrintDepartment.next_receiver = InvestigationsDepartment

# Creating the requests (the order of handling):
request1 = EditorialOrder.new(
  :investigation, :news, :sport, :news, :culture, :news, :print
)

# The automatic sequence of handlers dependent on the sequence of chain links:
request2 = EditorialOrder.new(:all)

# Start running the chain with first request (will work several times):
InvestigationsDepartment.handle request1
sleep 5

# \Cause the chain is closed it's not important which element starts handling:
PrintDepartment.handle request1
sleep 5

# Start running the chain with other request (which is automatic):
InvestigationsDepartment.handle request2
