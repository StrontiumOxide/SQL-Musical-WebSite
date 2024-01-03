create table if not exists Executor (
	ExecutorID integer primary key,
	Name text not null
);
	
create table if not exists Genre (
	GenreID serial primary key,
	Name text not null
);

create table if not exists GenreExecutor (
	GenreID serial references Genre(GenreID),
	ExecutorID integer references Executor(ExecutorID),
	constraint GE primary key (GenreID, ExecutorID)
);

create table if not exists Album (
	AlbumID serial primary key,
	Name text not null,
	"Year of issue" date not null
);

create table if not exists ExecutorAlbum (
	ExecutorID integer references Executor(ExecutorID),
	AlbumID serial references Album(AlbumID),
	constraint EA primary key (ExecutorID, AlbumID)
);

create table if not exists Track (
	TrackID serial primary key,
	Name text not null,
	Duration integer not null,
	AlbumID serial references Album(AlbumID)
);

create table if not exists Collections (
	CollectionsID serial primary key,
	Name text not null,
	"Year of issue" date not null
);

create table if not exists TrackCollections (
	TrackID serial references Track(TrackID),
	CollectionsID serial references Collections(CollectionsID),
	constraint TC primary key (TrackID, CollectionsID)
);