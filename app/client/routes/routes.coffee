Tribute.Router = Ember.Router.extend
  location: 'history'

Tribute.Router.map ->
  @resource 'index', path: '/'
  @resource 'projects', path: '/projects', () ->
    @route 'new', path: '/new'
    @resource 'project', path: '/:project_id', () ->
      @route 'show', path: '/'
  @resource 'companies', path: '/companies', () ->
    @route 'new', path: '/new'
    @resource 'company', path: '/:company_id', () ->
      @route 'show', path: '/'

Tribute.ProjectsRoute = Ember.Route.extend
  model: () -> 
    return Tribute.Project.find()
  renderTemplate: () ->
    @render 'projects', into: 'application'

Tribute.ProjectShowRoute = Ember.Route.extend
  model: () ->
    @modelFor 'project'

Tribute.CompaniesRoute = Ember.Route.extend
  model: () -> 
    return Tribute.Company.find()
  renderTemplate: () ->
    @render 'companies', into: 'application'

Tribute.CompanyShowRoute = Ember.Route.extend
  model: () ->
    @modelFor 'company'
