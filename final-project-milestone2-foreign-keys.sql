USE CoastalServices;
GO
ALTER TABLE Corporation WITH CHECK
ADD CONSTRAINT FK_ZipCode FOREIGN KEY(ZipCode) REFERENCES ZipCode(Zip)
ON UPDATE CASCADE
GO
ALTER TABLE Corporation WITH CHECK
ADD CONSTRAINT FK_OwnerID FOREIGN KEY(OwnerID) REFERENCES Ownership(ownershipID)
ON UPDATE CASCADE
GO
ALTER TABLE Subsidiaries WITH CHECK
ADD CONSTRAINT FK_corpID FOREIGN KEY(corpID) REFERENCES Corporation(ID)
ON UPDATE CASCADE
GO
ALTER TABLE Subsidiaries WITH CHECK
ADD CONSTRAINT FK_establishmentTypeID FOREIGN KEY(TypeID) REFERENCES establishmentType(establishmentTypeID)
ON UPDATE CASCADE
GO
ALTER TABLE Employees WITH CHECK
ADD CONSTRAINT FK_SubsidiaryID FOREIGN KEY(SubsidiaryID) REFERENCES Subsidiaries(ID)
ON UPDATE CASCADE
GO