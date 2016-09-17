package nslm2.modules.battles.battle
{
   import game.ui.fightPlayers.BattleHeadPortraitUI;
   import nslm2.modules.fightPlayer.UnitVo;
   import com.mz.core.mgrs.UIMgr;
   import flash.events.KeyboardEvent;
   import nslm2.modules.dungeons.HeadPortraitRender;
   import flash.events.MouseEvent;
   import morn.core.components.Box;
   
   public class BattleHeadPortrait extends BattleHeadPortraitUI
   {
       
      
      private var autoCheckIndex:int = 0;
      
      public function BattleHeadPortrait()
      {
         super();
      }
      
      override protected function initialize() : void
      {
         super.initialize();
      }
      
      public function show(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = [];
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for each(var _loc4_ in param1)
         {
            if(_loc4_.isAttack)
            {
               if(_loc4_.stcNpcVo.kind == 21)
               {
                  _loc3_ = _loc4_;
               }
               else
               {
                  _loc2_.push(_loc4_);
               }
            }
         }
         _loc2_.sortOn("posId",16);
         if(_loc3_)
         {
            _loc2_.unshift(_loc3_);
         }
         list_headPortrait.repeatX = _loc2_.length;
         this.list_headPortrait.dataSource = _loc2_;
         UIMgr.stage.addEventListener("keyDown",onkey);
         autoCheckIndex = 0;
      }
      
      public function showDef(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = [];
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for each(var _loc4_ in param1)
         {
            if(_loc4_.isAttack == 0)
            {
               if(_loc4_.stcNpcVo.kind == 21)
               {
                  _loc3_ = _loc4_;
               }
               else
               {
                  _loc2_.push(_loc4_);
               }
            }
         }
         _loc2_.sortOn("posId",16);
         if(_loc3_)
         {
            _loc2_.unshift(_loc3_);
         }
         list_headPortrait.repeatX = _loc2_.length;
         this.list_headPortrait.dataSource = _loc2_;
         UIMgr.stage.addEventListener("keyDown",onkey);
      }
      
      protected function onkey(param1:KeyboardEvent) : void
      {
         if(GameObjectManager.Instance.autoFire)
         {
            return;
         }
         var _loc3_:int = -1;
         switch(int(param1.keyCode) - 49)
         {
            case 0:
               _loc3_ = 0;
               break;
            case 1:
               _loc3_ = 1;
               break;
            case 2:
               _loc3_ = 2;
               break;
            case 3:
               _loc3_ = 3;
               break;
            case 4:
               _loc3_ = 4;
               break;
            case 5:
               _loc3_ = 5;
         }
         var _loc2_:Array = list_headPortrait.dataSource as Array;
         if(_loc3_ >= _loc2_.length || _loc3_ <= -1)
         {
            return;
         }
         HeadPortraitRender(list_headPortrait.getCell(_loc3_)).img_rim.dispatchEvent(new MouseEvent("click",true));
      }
      
      public function checkAutoFire() : void
      {
         var _loc1_:int = list_headPortrait.array.length;
         var _loc2_:HeadPortraitRender = list_headPortrait.getCell(autoCheckIndex) as HeadPortraitRender;
         if(!_loc2_.isDie && _loc2_.rageFull)
         {
            _loc2_.autoFire();
         }
         autoCheckIndex = Number(autoCheckIndex) + 1;
         autoCheckIndex = autoCheckIndex % _loc1_;
      }
      
      public function checkMouseState() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc1_:int = list_headPortrait.array.length;
         _loc3_ = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = list_headPortrait.getCell(_loc3_) as HeadPortraitRender;
            _loc2_.checkMouseState();
            _loc3_++;
         }
      }
      
      public function onBeginGuideCheck() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc1_:int = list_headPortrait.array.length;
         _loc3_ = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ = list_headPortrait.getCell(_loc3_) as HeadPortraitRender;
            if(_loc2_.onBeginGuideCheck())
            {
               return;
            }
            _loc3_++;
         }
      }
      
      override public function get width() : Number
      {
         var _loc1_:Array = list_headPortrait.dataSource as Array;
         if(_loc1_ == null || _loc1_.length <= 0)
         {
            return 0;
         }
         var _loc2_:Box = this.list_headPortrait.getCell(_loc1_.length - 1);
         return _loc2_.x + _loc2_.width;
      }
      
      override public function dispose() : void
      {
         UIMgr.stage.removeEventListener("keyDown",onkey);
         super.dispose();
      }
   }
}
