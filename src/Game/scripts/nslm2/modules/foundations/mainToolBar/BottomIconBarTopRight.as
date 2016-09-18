package nslm2.modules.foundations.mainToolBar
{
   import game.ui.mainToolBar.BottomIconBarTopRightUI;
   import com.mz.core.utils.LocalData;
   import morn.core.components.Button;
   import com.greensock.TweenLite;
   import morn.customs.expands.MornExpandUtil;
   
   public class BottomIconBarTopRight extends BottomIconBarTopRightUI
   {
       
      
      private var idArr:Array;
      
      public var btnSmallLib:Object;
      
      public var redPointArr:Vector.<nslm2.modules.foundations.mainToolBar.RedPointVo>;
      
      private var _singleLineShowNum:int;
      
      private var _lastModuleIdArr:Array;
      
      private var _isShow:Boolean = true;
      
      private var _localDataKey:String = "main";
      
      public function BottomIconBarTopRight()
      {
         idArr = [];
         btnSmallLib = {};
         _lastModuleIdArr = [];
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         this.box_icons.mask = this.img_mask;
         this.visible = false;
         this.btn_page.bg.smoothing = true;
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
      
      public function set singleLineShowNum(param1:int) : void
      {
         if(_singleLineShowNum != param1)
         {
            _singleLineShowNum = param1;
            validatePosition();
         }
      }
      
      private function validatePosition() : void
      {
         if(_lastModuleIdArr.length > 0)
         {
            moduleIdArr = _lastModuleIdArr;
         }
      }
      
      public function getNewRender() : BottomIconRenderTopRight
      {
         return new BottomIconRenderTopRight();
      }
      
      public function getId(param1:Array, param2:int) : int
      {
         return param1[param2];
      }
      
      public function get moduleIdArr() : Array
      {
         return _lastModuleIdArr;
      }
      
      public function set moduleIdArr(param1:Array) : void
      {
         var _loc9_:* = null;
         var _loc11_:* = null;
         var _loc10_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc6_:int = 0;
         _lastModuleIdArr = param1;
         var _loc7_:Array = [];
         var _loc5_:Array = [];
         var _loc3_:Array = [];
         var _loc8_:int = idArr.length;
         _loc10_ = 0;
         while(_loc10_ < _loc8_)
         {
            _loc4_ = idArr[_loc10_];
            _loc9_ = btnSmallLib[_loc4_] as BottomIconRenderTopRight;
            _loc9_.singleLineShowNum = _singleLineShowNum;
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
            _loc6_ = getId(param1,_loc10_);
            if(_loc3_.indexOf(_loc6_) == -1)
            {
               _loc9_ = getNewRender();
               _loc9_.redPointArr = this.redPointArr;
               _loc9_.dataSource = param1[_loc10_];
               _loc9_.singleLineShowNum = _singleLineShowNum;
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
               this.box_icons.addChildAt(_loc9_,0);
               _loc9_.tweenTemp(idArr.length == 0);
            }
            else
            {
               _loc9_ = btnSmallLib[_loc6_] as BottomIconRenderTopRight;
               this.box_icons.addChildAt(_loc9_,0);
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
            this.box_icons.addChildAt(_loc9_,0);
            _loc10_++;
         }
         _isShow = LocalData.insCurPlayer.load(key,true);
         changeIconBarShow(_isShow);
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_page === _loc2_)
         {
            _isShow = LocalData.insCurPlayer.load(key,true);
            _isShow = !_isShow;
            changeIconBarShow(_isShow);
         }
      }
      
      public function changeIconBarShow(param1:Boolean) : void
      {
         _isShow = param1;
         LocalData.insCurPlayer.save(key,_isShow);
         this.visible = moduleIdArr.length > 0;
         if(!_isShow)
         {
            TweenLite.to(this.box_icons,0.2,{
               "x":1000,
               "alpha":0
            });
         }
         else
         {
            TweenLite.to(this.box_icons,0.2,{
               "x":0,
               "alpha":1
            });
         }
      }
      
      protected function get key() : String
      {
         return "bottomIconTopRight" + _localDataKey;
      }
   }
}
