package zcale.build.project.interfaces;

import zcale.build.project.options.ProjectOptions;
import zcale.patterns.interfaces.IStringable;

interface IProject<T> extends IStringable
{
	public var options : ProjectOptions<T>;
}