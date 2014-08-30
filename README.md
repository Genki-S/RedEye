RedEye
======

Record your pomodoro through API and see your achievements. (heroku is super WIP)

It's meant to be used from [Emacs org mode](http://orgmode.org/).

Elisp package is coming! For now, see
[dirty script in my dotfiles](https://github.com/Genki-S/dotfiles/blob/master/emacs.d/my-scripts/org-recodoro.el).

## Getting Started (development)

### Install Ruby and Rails

This application requires:

- Ruby 2.1.0
- Rails 4.1.4

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

### Install PostgreSQL

This application is developed under:

- postgres (PostgreSQL) 9.3.5

Learn more about [Installing PostgreSQL](https://wiki.postgresql.org/wiki/Detailed_installation_guides).

### Install Bundles

```
$ bundle install
```

### Start up the rails server

1. Start postgres deamon (`$ postgres -D datadir`)

   `man postgres` for more about -D option.

2. Start rails server and other goodies (`$ guard`)

3. Access [http://localhost:3000](http://localhost:3000)

### Misc.

Facebook login might not work for non-developer user accounts.
I'll do something about it.

## Documentation and Support

Not available for now. Sorry, I'm working on it.

## Issue Report

[Submit an issue](https://github.com/Genki-S/RedEye/issues).

## Similar Projects

All similar projects comes with task management system bundled with them.
e.g.:

- [KanbanFlow](https://kanbanflow.com)
- [TeamViz](http://www.teamviz.com)

You know, we org mode users (and other task management geeks) have our way to do that.

## Contributing

Pull Requests Welcome!

## Credits

TODO

## License

TODO

## TODO

- API Boost
  - [ ] Make it possible to pass evaluation for each pomodoro
- Web App Boost
  - [ ] User can see his/her pomodori
  - [ ] List up pomodori by days
  - [ ] Design: time representation
  - [ ] Design: evaluation representation
  - [ ] Design: make a logo
- Org mode Boost
  - [ ] Make elisp an el-get package
- Other Boosts
  - [ ] Write Readme
  - [ ] Think better name
  - [ ] Make facebook login open (without test user/developer settings)
  - [ ] What to do with task switch (when a task is finished before 25min.)
