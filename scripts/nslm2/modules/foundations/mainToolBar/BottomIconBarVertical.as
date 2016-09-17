package nslm2.modules.foundations.mainToolBar
{
   import game.ui.mainToolBar.BottomIconBarVerticalUI;
   
   public class BottomIconBarVertical extends BottomIconBarVerticalUI
   {
       
      
      private var idArr:Array;
      
      public var btnSmallLib:Object;
      
      public var redPointArr:Vector.<nslm2.modules.foundations.mainToolBar.RedPointVo>;
      
      public var newArr:Vector.<int>;
      
      public var useFade:Boolean;
      
      public function BottomIconBarVertical()
      {
         idArr = [];
         btnSmallLib = {};
         super();
         this.removeAllChild();
      }
      
      public function validateRedPoint() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = btnSmallLib;
         for each(var _loc1_ in btnSmallLib)
         {
            _loc1_.validateRedPoint();
         }
      }
      
      public function set moduleIdArr(param1:Array) : void
      {
         var _loc9_:* = null;
         var _loc11_:* = null;
         var _loc10_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Array = [];
         var _loc5_:Array = [];
         var _loc3_:Array = [];
         var _loc8_:int = idArr.length;
         _loc10_ = 0;
         while(_loc10_ < _loc8_)
         {
            _loc4_ = idArr[_loc10_];
            _loc9_ = btnSmallLib[_loc4_] as BottomIconRender;
            _loc2_ = param1.indexOf(_loc4_);
            if(_loc2_ == -1)
            {
               if(_loc11_ != null)
               {
                  _loc9_.tempPos = _loc11_.tempPos;
               }
               else
               {
                  _loc9_.tempPos = -1;
               }
               _loc9_.newPos = -1;
               _loc5_.push(_loc9_);
               delete btnSmallLib[_loc4_];
            }
            else
            {
               _loc9_.tempPos = _loc7_.length;
               _loc9_.newPos = _loc2_;
               _loc7_.push(_loc4_);
               _loc3_.push(_loc4_);
            }
            _loc9_.tweenTemp(false);
            _loc11_ = _loc9_;
            _loc10_++;
         }
         _loc11_ = null;
         _loc8_ = param1.length;
         _loc10_ = 0;
         while(_loc10_ < _loc8_)
         {
            _loc6_ = param1[_loc10_];
            if(_loc3_.indexOf(_loc6_) == -1)
            {
               _loc9_ = new BottomIconRender();
               _loc9_.useFade = useFade;
               _loc9_.redPointArr = this.redPointArr;
               _loc9_.newArr = this.newArr;
               _loc9_.isVertical = true;
               _loc9_.dataSource = _loc6_;
               if(_loc11_ != null)
               {
                  _loc9_.tempPos = _loc11_.tempPos;
               }
               else
               {
                  _loc9_.tempPos = -1;
               }
               _loc9_.newPos = _loc10_;
               btnSmallLib[_loc6_] = _loc9_;
               _loc3_.push(_loc6_);
               this.addChildAt(_loc9_,0);
               _loc9_.tweenTemp(idArr.length == 0);
            }
            else
            {
               _loc9_ = btnSmallLib[_loc6_] as BottomIconRender;
               this.addChildAt(_loc9_,0);
            }
            _loc11_ = _loc9_;
            _loc10_++;
         }
         idArr = _loc3_;
         _loc8_ = _loc5_.length;
         _loc10_ = 0;
         while(_loc10_ < _loc8_)
         {
            _loc9_ = _loc5_[_loc10_];
            this.addChildAt(_loc9_,0);
            _loc10_++;
         }
      }
   }
}
