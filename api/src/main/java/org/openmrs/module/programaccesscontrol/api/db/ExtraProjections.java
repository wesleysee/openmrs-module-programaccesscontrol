package org.openmrs.module.programaccesscontrol.api.db;

public final class ExtraProjections {
	
	public static MultipleCountDistinctProjection countMultipleDistinct(String propertyName) {
		return new MultipleCountDistinctProjection(propertyName);
	}
	
	public static MultipleCountDistinctProjection countMultipleDistinct(String propertyName, boolean includeNull) {
		return new MultipleCountDistinctProjection(propertyName, includeNull);
	}
}
