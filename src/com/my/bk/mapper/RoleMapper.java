package com.my.bk.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.my.bk.entities.Role;

public interface RoleMapper {
	
	@Select(value="SELECT id,r_name as name,description,state FROM bs_role WHERE id=#{id}")
	Role getRoleById(@Param("id") Integer id);
}