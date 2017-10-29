/*
 * @Two-level Checkbox
 * Useage: $('#tlcheck_1').tlCheck('369,370');
 * Select All input field ID: tlcheck_1_all
 * Select inputs field ID: tlcheck_1_values
 * Name display box ID: tlcheck_1_names
 */
 $.fn.extend({
   tlCheck: function (options) {
     var settings = $.extend({
       "item": "0",
       "all": "0",
       "max": 0
     }, options);


     if (this[0] == undefined)
       return false;

     var _id = '#' + $(this).attr('id'),
         _fn = {};

     // Select All values
     $.each(settings.all.split(','), function(index, val) {
       $(_id + ' .select_all input[value=\'' + val + '\']').prop("checked", true);
       $(_id + ' .select_items input.' + val).prop({"checked": true, "disabled": true});
     });
     // Childrens values
     $.each(settings.item.split(','), function(index, val) {
       $(_id + ' input[value=\'' + val + '\']').prop("checked", true);
     });

     // Select All
     $(_id + ' .select_all').css('display', settings.max != 0 ? 'none': 'block');
     $(_id + ' .select_all input').on('click', function(event) {
       var _flag = $(this).prop('checked')
           _var  = $(this).val();
       $(_id + ' input.' + _var).prop('checked', _flag).attr('disabled', _flag);
       _fn.reload();
     });
     // Children item checked
     $(_id + ' .select_items input').on('click',function(event) {
       _fn.reload();
     });

     // Reset
     $(_id + ' .select_reset').on('click', function(event) {
       $(_id + ' input').prop({'checked':false, 'disabled': false});
       _fn.reload();
     });

     /*
       Functions
     */
     _fn.max = function (len) {
       $(_id + ' .select_items input:not(:checked)').prop('disabled', len >= settings.max && settings.max != 0);
     }
     // Checked Count
     _fn.count = function () {

       $(_id + ' .select_items').each(function(i) {
         var _AllNum = $(this).find('input').length;
         var _checkedNum = $(this).find('input:checked').length;
         $(_id + ' .tabs-left li').eq(i).children('span.badge')[ _checkedNum > 0 ? 'removeClass':'addClass']('hide').text(_checkedNum);
       });

       var _checkedAll = $(_id + ' .select_items input:checked').length;
       _fn.max(_checkedAll);
     }

     // Push Values
     _fn.pushId = function () {
       var _itemVal = [],
           _itemAll = [];

       $(_id + ' .select_items input:checked').each(function() {
         _itemVal.push(this.value);
       });
       $(_id + ' .select_all input:checked').each(function() {
         _itemAll.push(this.value);
       });

       $(_id + '_values').val(_itemVal.join(','));
       $(_id + '_all').val(_itemAll.join(','));
     }

     // Push Names
     _fn.pushName = function () {
       var _itemName = [];
       $(_id + ' .select_items input:checked').each(function() {
         _itemName.push($(this).data('name'));
       });
       $(_id + '_names').text(_itemName.length < 1 ? $(_id + '_names').data('text') : _itemName.join(','));
     }

     // Reload
     _fn.reload = function () {
       this.count();
       this.pushId();
       this.pushName();
     }
     _fn.reload();
   }, // end tlcheck function
   dealTag: function (options) {
     var settings = $.extend({
       "max": 0
     }, options);

     var _id = '#' + $(this).attr('id'),
         _fn = {};

     _fn.max = function (len) {
       var _flag = len >= settings.max && settings.max != 0;
       $(_id + ' input:not(:checked)').prop('disabled', _flag).parent().attr('disabled', _flag);
     };

     _fn.reload = function () {
       $(_id + ' input').each(function() {
         $(this).parent()[$(this).prop('checked') ? 'addClass' : 'removeClass']('bg-light-blue');
       });
       this.max($(_id + ' input:checked').length);
     }

     $(_id + ' input').on('change',function(event) {
       _fn.reload();
     });
     _fn.reload();
   }
 });