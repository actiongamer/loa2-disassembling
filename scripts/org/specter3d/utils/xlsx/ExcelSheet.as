package org.specter3d.utils.xlsx
{
   public class ExcelSheet
   {
       
      
      private var _cols:uint = 0;
      
      private var _excelArray:Array;
      
      private var _row:uint = 0;
      
      private var _name:String;
      
      public function ExcelSheet(param1:String)
      {
         _excelArray = [];
         super();
         this._name = param1;
      }
      
      public function get cols() : uint
      {
         return (_excelArray[0] as Array).length;
      }
      
      public function get row() : uint
      {
         return _excelArray.length;
      }
      
      public function getData(param1:uint, param2:uint) : *
      {
         if(!_excelArray[param1])
         {
            return null;
         }
         if(_excelArray[param1].length < param2)
         {
            return null;
         }
         return _excelArray[param1][param2];
      }
      
      function decoding(param1:String, param2:Array) : void
      {
         var _loc11_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc9_:XML = new XML(param1);
         var _loc5_:Namespace = _loc9_.namespace();
         var _loc7_:XMLList = _loc9_._loc5_::sheetData._loc5_::row;
         var _loc15_:int = 0;
         var _loc14_:* = _loc7_;
         for each(var _loc8_ in _loc7_)
         {
            _row = int(_loc8_.@r) - 1;
            _loc11_ = [];
            _loc4_ = _loc8_._loc5_::c;
            var _loc13_:int = 0;
            var _loc12_:* = _loc4_;
            for each(var _loc10_ in _loc4_)
            {
               _cols = getColIndex(_loc10_.@r);
               _loc6_ = _loc10_.@t;
               _loc3_ = _loc10_._loc5_::v[0];
               if(_loc6_ == "s")
               {
                  _loc11_[_cols] = param2[int(_loc3_)];
               }
               else
               {
                  _loc11_[_cols] = _loc3_;
               }
            }
            _excelArray[_row] = _loc11_;
         }
      }
      
      private function getColIndex(param1:String) : int
      {
         var _loc2_:String = param1.replace(/(\d)/g,"");
         return textToInt(_loc2_);
      }
      
      private function textToInt(param1:String) : int
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:* = 0;
         _loc4_ = param1.length - 1;
         while(_loc4_ >= 0)
         {
            _loc3_ = param1.charCodeAt(_loc4_) - 65;
            if(_loc4_ == param1.length - 1)
            {
               _loc2_ = _loc3_;
            }
            else
            {
               _loc2_ = int(_loc2_ + (_loc3_ + 1) * 26);
            }
            _loc4_--;
         }
         return _loc2_;
      }
      
      public function get name() : String
      {
         return _name;
      }
   }
}
