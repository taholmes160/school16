from flask_principal import Permission, RoleNeed, UserNeed
from flask_login import current_user
       
class AdminPermission(Permission):
    def __init__(self):
        super(AdminPermission, self).__init__()

    def can(self):
        if not current_user.is_authenticated:
            return False
        needs = [UserNeed(current_user.id)]
        admin_roles = ['IT Support', 'OtherAdminRole1', 'OtherAdminRole2']  # Add other admin roles here
        for role in admin_roles:
            needs.append(RoleNeed(role))
        self.needs = set(needs)
        return super(AdminPermission, self).can()