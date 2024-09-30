"""add phone number to student profile

Revision ID: 57b897485584
Revises: b4c97bce2647
Create Date: 2024-09-25 12:05:34.464373

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '57b897485584'
down_revision = 'b4c97bce2647'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('student_profile', schema=None) as batch_op:
        batch_op.add_column(sa.Column('phone_number', sa.String(length=20), nullable=True))

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('student_profile', schema=None) as batch_op:
        batch_op.drop_column('phone_number')

    # ### end Alembic commands ###
