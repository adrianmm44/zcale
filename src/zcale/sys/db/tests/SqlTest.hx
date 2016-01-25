package zcale.sys.db.tests;

import zcale.sys.db.Sql;

class SqlTest
{
	static function main()
	{
		trace( Sql.query.create.database("db"));
		trace( Sql.query.selectAll.from("table"));
		trace( Sql.query.select(["column1","column2"]).from("table"));
		trace( Sql.query.selectDistinct(["column1","column2"]).from("table"));
		trace( Sql.query.selectAll.from("table").where("column").is("value"));
		trace( Sql.query.selectAll.from("table").where("column").inRange([1,2,3]));
		trace( Sql.query.selectAll.from("table").where("column1").is("value1").and("column2").is("value2").or("column3").is("value3"));
		trace( Sql.query.selectAll.from("table").orderBy.asc("column1").desc("solumn2"));
		trace( Sql.query.insert("table", ["column1","column2","column3"]).values(["value1","value2","value3"]));
		trace( Sql.query.update("table").set("column1","value1").set("column2", "value2").where("column").is("value"));
		trace( Sql.query.delete.from("table").where("column").is("value"));
		trace( Sql.query.deleteAll.from("table"));
		trace( Sql.query.selectAll.from("table").where("column").like.contains("something"));
		trace( Sql.query.selectAll.from("table").where("column").like.pattern( Sql.pattern.range("a-c").zeroOrMore ));
		trace( Sql.query.selectAll.from("table").where("column").like.pattern( Sql.pattern.chars("L_n_on")) );
		trace( Sql.query.selectAll.from("table").where("column").like.pattern( Sql.pattern.chars("L").anyChar.chars("n").anyChar.chars("on")));
		trace( Sql.query.selectAll.from("table").where("column").between( 10, 20 ));
		trace( Sql.query.select(["t1.column1","t1.column2","t2.column1"]).from("table1").as("t1").from("table2").as("t2"));
		trace( Sql.query.select(["table1.column1","table1.column2","table2.column1"]).from("table1").join.inner("table2").on("table1.table2_id","table2.table2_id"));
		trace( Sql.query.select(["column1","column2"]).from("table1").union.select(["column1","column2"]).from("table2"));
	}
}