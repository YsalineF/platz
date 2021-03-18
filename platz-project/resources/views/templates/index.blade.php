<!DOCTYPE HTML>
<html>

@include('templates.partials._head')

<body>

<a name="ancre"></a>

<!-- CACHE -->
<div class="cache"></div>
<div id="app">
  @include('templates.partials._header')
  <menu-categories></menu-categories>
  @include('templates.partials._filter')
  @include('templates.partials._portfolio')
</div>

  @include('templates.partials._scripts')
  @include('templates.partials._preloader')

</body>


</html>
