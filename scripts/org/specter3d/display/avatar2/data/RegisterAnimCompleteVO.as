package org.specter3d.display.avatar2.data
{
   public class RegisterAnimCompleteVO implements IRegisterAnimComplete
   {
       
      
      private var _allAnimList:Array;
      
      private var _allAnimCompleteList:Array;
      
      private var _hadAnimList:Array;
      
      private var _noAnimList:Array;
      
      private var _maxNum:int;
      
      private var _curNum:int;
      
      private var _num:int;
      
      public function RegisterAnimCompleteVO()
      {
         super();
         init();
      }
      
      public function get allAnimCompleteList() : Array
      {
         return _allAnimCompleteList;
      }
      
      public function get hadAnimList() : Array
      {
         return _hadAnimList;
      }
      
      public function get noAnimList() : Array
      {
         return _noAnimList;
      }
      
      public function get isComplete() : Boolean
      {
         if(_allAnimCompleteList != null && _allAnimList != null)
         {
            return _allAnimCompleteList.length == _allAnimList.length?true:false;
         }
         return false;
      }
      
      public function get initNum() : int
      {
         return _num;
      }
      
      public function get allAnimList() : Array
      {
         return _allAnimList;
      }
      
      public function get isSendEvt() : Boolean
      {
         return _maxNum == _curNum?true:false;
      }
      
      public function addAllAnimList(param1:Vector.<AnimData>) : void
      {
         if(param1 != null && _allAnimList != null)
         {
            _num = Number(_num) + 1;
            var _loc4_:int = 0;
            var _loc3_:* = param1;
            for each(var _loc2_ in param1)
            {
               _maxNum = Number(_maxNum) + 1;
               _allAnimList.push(_loc2_.animName);
            }
         }
      }
      
      public function addAnimCompleteList(param1:String) : void
      {
         if(_allAnimCompleteList != null && _allAnimList != null && _allAnimList.indexOf(param1) >= 0)
         {
            updateCurNum();
            _allAnimCompleteList.push(param1);
         }
      }
      
      public function addHadAnimListList(param1:String) : void
      {
         if(_hadAnimList != null && _allAnimList != null && _allAnimList.indexOf(param1) >= 0)
         {
            updateCurNum();
            _hadAnimList.push(param1);
         }
      }
      
      private function updateCurNum() : void
      {
         _curNum = Number(_curNum) + 1;
      }
      
      public function addNoAnimList(param1:String) : void
      {
         if(_noAnimList != null && _allAnimList != null && _allAnimList.indexOf(param1) >= 0)
         {
            updateCurNum();
            _noAnimList.push(param1);
         }
      }
      
      private function init() : void
      {
         _allAnimList = [];
         _allAnimCompleteList = [];
         _hadAnimList = [];
         _noAnimList = [];
      }
   }
}
