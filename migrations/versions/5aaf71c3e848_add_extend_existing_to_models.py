"""Add extend_existing to models

Revision ID: 5aaf71c3e848
Revises: 333a82e3e650
Create Date: 2024-09-21 16:35:35.305915

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import mysql

# revision identifiers, used by Alembic.
revision = '5aaf71c3e848'
down_revision = '333a82e3e650'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('role', schema=None) as batch_op:
        batch_op.alter_column('name',
               existing_type=mysql.VARCHAR(length=64),
               nullable=False)

    with op.batch_alter_table('state', schema=None) as batch_op:
        batch_op.alter_column('name',
               existing_type=mysql.VARCHAR(length=64),
               nullable=False)

    with op.batch_alter_table('student_profile', schema=None) as batch_op:
        batch_op.alter_column('grade',
               existing_type=mysql.INTEGER(display_width=11),
               type_=sa.String(length=64),
               existing_nullable=False)
        batch_op.alter_column('address1',
               existing_type=mysql.VARCHAR(length=100),
               type_=sa.String(length=128),
               existing_nullable=False)
        batch_op.alter_column('address2',
               existing_type=mysql.VARCHAR(length=100),
               type_=sa.String(length=128),
               existing_nullable=True)
        batch_op.alter_column('city',
               existing_type=mysql.VARCHAR(length=50),
               type_=sa.String(length=64),
               existing_nullable=False)

    with op.batch_alter_table('user', schema=None) as batch_op:
       batch_op.alter_column('username',
              existing_type=mysql.VARCHAR(length=64),
              nullable=False)
       batch_op.alter_column('email',
              existing_type=mysql.VARCHAR(length=120),
              nullable=False)
       batch_op.alter_column('password_hash',
              existing_type=mysql.VARCHAR(length=512),
              type_=sa.String(length=2048),
              nullable=True)
       batch_op.alter_column('first_name',
              existing_type=mysql.VARCHAR(length=64),
              nullable=False)
       batch_op.alter_column('last_name',
              existing_type=mysql.VARCHAR(length=64),
              nullable=False)
       batch_op.alter_column('role_id',
               existing_type=mysql.INTEGER(display_width=11),
               nullable=False)

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('user', schema=None) as batch_op:
        batch_op.alter_column('role_id',
               existing_type=mysql.INTEGER(display_width=11),
               nullable=True)
        batch_op.alter_column('last_name',
               existing_type=mysql.VARCHAR(length=64),
               nullable=True)
        batch_op.alter_column('first_name',
               existing_type=mysql.VARCHAR(length=64),
               nullable=True)
        batch_op.alter_column('password_hash',
               existing_type=mysql.VARCHAR(length=512),
               nullable=True)
        batch_op.alter_column('email',
               existing_type=mysql.VARCHAR(length=120),
               nullable=True)
        batch_op.alter_column('username',
               existing_type=mysql.VARCHAR(length=64),
               nullable=True)

    with op.batch_alter_table('student_profile', schema=None) as batch_op:
        batch_op.alter_column('city',
               existing_type=sa.String(length=64),
               type_=mysql.VARCHAR(length=50),
               existing_nullable=False)
        batch_op.alter_column('address2',
               existing_type=sa.String(length=128),
               type_=mysql.VARCHAR(length=100),
               existing_nullable=True)
        batch_op.alter_column('address1',
               existing_type=sa.String(length=128),
               type_=mysql.VARCHAR(length=100),
               existing_nullable=False)
        batch_op.alter_column('grade',
               existing_type=sa.String(length=64),
               type_=mysql.INTEGER(display_width=11),
               existing_nullable=False)

    with op.batch_alter_table('state', schema=None) as batch_op:
        batch_op.alter_column('name',
               existing_type=mysql.VARCHAR(length=64),
               nullable=True)

    with op.batch_alter_table('role', schema=None) as batch_op:
        batch_op.alter_column('name',
               existing_type=mysql.VARCHAR(length=64),
               nullable=True)

    # ### end Alembic commands ###
