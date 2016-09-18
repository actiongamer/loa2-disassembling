package nslm2.common.compsEffects
{
   import com.mz.core.utils2.task.TaskBase;
   import morn.core.components.List;
   import com.mz.core.display.MzSprite;
   import flash.utils.Dictionary;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import morn.core.components.Box;
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import com.mz.core.utils2.ShakeUtil;
   
   public class ListCellTweenEffect extends TaskBase
   {
       
      
      public var duration:Number = 0.5;
      
      private var list:List;
      
      private var newData:Array;
      
      public var fakeBox:MzSprite;
      
      private var compareDataHandler;
      
      private var needShake:Boolean;
      
      private var oldCellLib:Dictionary;
      
      private var mask:Bitmap;
      
      public function ListCellTweenEffect(param1:List, param2:Array)
      {
         oldCellLib = new Dictionary();
         super();
         this.list = param1;
         this.newData = param2;
         this.fakeBox = new MzSprite();
      }
      
      public function set_duration(param1:Number) : ListCellTweenEffect
      {
         this.duration = param1;
         return this;
      }
      
      public function set_compareDataHandler(param1:*) : ListCellTweenEffect
      {
         this.compareDataHandler = param1;
         return this;
      }
      
      public function set_needShake(param1:Boolean) : ListCellTweenEffect
      {
         this.needShake = param1;
         return this;
      }
      
      override public function exec() : void
      {
         var _loc6_:int = 0;
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc4_:* = null;
         super.exec();
         var _loc3_:BitmapData = new BitmapData(list.width,list.height,false);
         _loc3_.draw(list);
         mask = new Bitmap(_loc3_);
         var _loc5_:int = this.list.cells.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc1_ = this.list.cells[_loc6_];
            if(_loc1_.dataSource)
            {
               _loc2_ = new BitmapData(_loc1_.width,_loc1_.height,true,0);
               _loc2_.draw(_loc1_);
               _loc4_ = new Bitmap(_loc2_);
               _loc4_.x = _loc1_.x;
               _loc4_.y = _loc1_.y;
               if(compareDataHandler)
               {
                  oldCellLib[compareDataHandler(_loc1_.dataSource)] = _loc4_;
               }
               else
               {
                  oldCellLib[_loc1_.dataSource] = _loc4_;
               }
            }
            _loc6_++;
         }
         this.list.array = this.newData;
         this.list.commitMeasure();
         fakeBox.addChild(mask);
         fakeBox.mask = mask;
         startTween();
      }
      
      private function startTween() : void
      {
         var _loc7_:int = 0;
         var _loc1_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc5_:int = this.list.cells.length;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc1_ = this.list.cells[_loc7_];
            if(_loc1_.dataSource)
            {
               if(compareDataHandler)
               {
                  _loc4_ = this.oldCellLib[compareDataHandler(_loc1_.dataSource)];
               }
               else
               {
                  _loc4_ = this.oldCellLib[_loc1_.dataSource];
               }
               if(_loc4_)
               {
                  if(_loc4_.x != _loc1_.x || _loc4_.y != _loc1_.y)
                  {
                     _loc3_++;
                     _loc6_ = {"x":_loc1_.x};
                     _loc6_.y = _loc1_.y;
                     if(this.needShake)
                     {
                        _loc6_.onComplete = this.doShake;
                        _loc6_.onCompleteParams = [_loc4_];
                        TweenLite.to(_loc4_,duration - 0.2,_loc6_);
                     }
                     else
                     {
                        TweenLite.to(_loc4_,duration,_loc6_);
                     }
                     this.fakeBox.addChild(_loc4_);
                     _loc1_.setVisibleList("ListCellTweenEffect",false);
                  }
                  else
                  {
                     if(this.needShake)
                     {
                        this.fakeBox.addChild(_loc4_);
                        _loc1_.setVisibleList("ListCellTweenEffect",false);
                     }
                     _loc2_.push(_loc4_);
                  }
               }
               else
               {
                  _loc1_.alpha = 0;
                  TweenLite.to(_loc1_,duration,{"alpha":1});
               }
            }
            _loc7_++;
         }
         if(_loc3_ > 0)
         {
            this.list.addChild(this.fakeBox);
            if(this.needShake)
            {
               TweenLite.delayedCall(duration,this.playEnd);
            }
            else
            {
               TweenLite.delayedCall(duration + 0.2,this.playEnd);
            }
         }
         else if(this.needShake)
         {
            this.list.addChild(this.fakeBox);
            shakeSameCells(_loc2_);
         }
         else
         {
            this.playEnd();
         }
      }
      
      private function shakeSameCells(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            this.doShake(_loc2_);
            _loc4_++;
         }
         TweenLite.delayedCall(0.4,this.playEnd);
      }
      
      public function doShake(param1:DisplayObject) : void
      {
         ShakeUtil.shakeUpDown(true,param1,6,3,0.0666666666666667);
      }
      
      public function playEnd() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = this.list.cells.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.list.cells[_loc3_];
            _loc1_.setVisibleList("ListCellTweenEffect",true);
            _loc3_++;
         }
         this.playeEnd2();
      }
      
      private function playeEnd2() : void
      {
         this.fakeBox.dispose();
         this.mask = null;
      }
   }
}
