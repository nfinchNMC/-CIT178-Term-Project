USE CoastalServices;
GO
CREATE INDEX idx_ZipCode ON Corporation(ZipCode);
GO
CREATE INDEX idx_OwnerID ON Corporation(OwnerID);
GO
CREATE INDEX idx_corpID ON Subsidiaries(corpID);
GO
CREATE INDEX idx_establishmentTypeID ON Subsidiaries(TypeID);
GO
CREATE INDEX idx_SubsidiaryID ON Employees(SubsidiaryID);