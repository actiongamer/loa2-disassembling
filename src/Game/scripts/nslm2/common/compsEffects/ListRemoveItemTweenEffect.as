package nslm2.common.compsEffects
{
   import com.mz.core.utils2.task.TaskBase;
   import flash.display.Bitmap;
   import morn.core.components.List;
   import com.mz.core.display.MzSprite;
   import flash.display.BitmapData;
   import morn.core.components.Box;
   import com.greensock.TweenLite;
   import com.greensock.easing.Back;
   
   public class ListRemoveItemTweenEffect extends TaskBase
   {
       
      
      public var duration:Number = 0.5;
      
      public var removeDuration:Number = 0.3;
      
      private var removeCellBitMap:Bitmap;
      
      private var list:List;
      
      private var newData:Array;
      
      public var fakeBox:MzSprite;
      
      private var removeIndex:int;
      
      private var mask:Bitmap;
      
      public function ListRemoveItemTweenEffect(param1:List, param2:int, param3:Array)
      {
         super();
         this.list = param1;
         this.newData = param3;
         this.fakeBox = new MzSprite();
         removeIndex = param2;
      }
      
      override public function exec() : void
      {
         var _loc3_:* = null;
         super.exec();
         var _loc2_:BitmapData = new BitmapData(list.width,list.height,false);
         _loc2_.draw(list);
         mask = new Bitmap(_loc2_);
         var _loc1_:Box = list.getCell(removeIndex);
         if(_loc1_)
         {
            _loc3_ = new BitmapData(_loc1_.width,_loc1_.height,true,0);
            _loc1_.visible = false;
            _loc3_.draw(_loc1_);
            removeCellBitMap = new Bitmap(_loc3_);
            removeCellBitMap.x = _loc1_.x;
            removeCellBitMap.y = _loc1_.y;
            TweenLite.to(removeCellBitMap,removeDuration,{
               "x":-_loc3_.width,
               "alpha":0,
               "ease":Back.easeIn
            });
            fakeBox.addChild(mask);
            fakeBox.mask = mask;
            fakeBox.addChild(removeCellBitMap);
            this.list.addChild(this.fakeBox);
         }
         TweenLite.delayedCall(removeDuration,startTween);
      }
      
      private function startTween() : void
      {
         var _loc4_:int = 0;
         var _loc1_:* = null;
         var _loc3_:* = null;
         this.list.array = this.newData;
         this.list.commitMeasure();
         var _loc2_:int = this.list.cells.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc1_ = this.list.cells[_loc4_];
            if(_loc1_.dataSource && _loc4_ >= removeIndex)
            {
               _loc1_.changeSelectState(1);
               _loc3_ = {};
               _loc3_.y = _loc1_.y;
               _loc1_.y = _loc1_.y + (_loc1_.height + list.spaceY);
               TweenLite.to(_loc1_,duration,_loc3_);
            }
            _loc4_++;
         }
         TweenLite.delayedCall(duration + 0.2,this.playEnd);
      }
      
      private function playEnd() : void
      {
         this.fakeBox.dispose();
         this.removeCellBitMap = null;
         this.mask = null;
      }
      
      public function set_duration(param1:Number) : ListRemoveItemTweenEffect
      {
         this.duration = param1;
         return this;
      }
      
      public function set_Removeduration(param1:Number) : ListRemoveItemTweenEffect
      {
         this.removeDuration = param1;
         return this;
      }
   }
}
