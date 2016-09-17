package nslm2.modules.dungeons
{
   import com.mz.core.interFace.IDispose;
   import morn.customs.components.ClipList;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.common.compsEffects.ScaleTweenEff;
   import com.greensock.easing.Elastic;
   import com.greensock.TweenLite;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   
   public class NumScroll implements IDispose
   {
       
      
      private var _oriNum:ClipList;
      
      public function NumScroll(param1:ClipList)
      {
         super();
         _oriNum = param1;
      }
      
      public function set value(param1:int) : void
      {
         v = param1;
         if(!_oriNum)
         {
            return;
         }
         if(v <= 0)
         {
            _oriNum.value = v;
            return;
         }
         var effNum:ClipList = new ClipList();
         effNum.smoothing = true;
         effNum.skin = "png.uiDungeonScene.clipList_turn";
         effNum.clipWidth = 50;
         effNum.value = v;
         effNum.commitMeasure();
         effNum.x = (UIMgr.gameWidth - effNum.width) / 2 - 8;
         effNum.y = 298;
         UIMgr.layer2D.addChild(effNum);
         new ScaleTweenEff().init(effNum,0.5,2,1,Elastic.easeInOut,false);
         TweenLite.to(effNum,0.2,{
            "y":-100,
            "delay":0.6
         });
         TweenLite.delayedCall(0.7,function():void
         {
            effNum.dispose();
            effNum = null;
            if(_oriNum.isDisposed)
            {
               return;
            }
            _oriNum.value = v;
            var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
            _loc1_.setAnchor(0.5,0.5);
            _loc1_.x = _oriNum.x + 2;
            _loc1_.y = 68;
            _loc1_.init(1015009,1,"all",false);
            _oriNum.parent.addChild(_loc1_);
         });
      }
      
      public function dispose() : void
      {
         if(_oriNum != null)
         {
            _oriNum.dispose();
            _oriNum = null;
         }
      }
   }
}
