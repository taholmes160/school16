"""update state in student profile

Revision ID: b4c97bce2647
Revises: 5aaf71c3e848
Create Date: 2024-09-23 13:29:28.680213

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import mysql

# revision identifiers, used by Alembic.
revision = 'b4c97bce2647'
down_revision = '5aaf71c3e848'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('user', schema=None) as batch_op:
        batch_op.alter_column('password_hash',
               existing_type=mysql.VARCHAR(length=2048),
               type_=sa.String(length=512),
               nullable=False)

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('user', schema=None) as batch_op:
        batch_op.alter_column('password_hash',
               existing_type=sa.String(length=512),
               type_=mysql.VARCHAR(length=2048),
               nullable=True)

    # ### end Alembic commands ###
