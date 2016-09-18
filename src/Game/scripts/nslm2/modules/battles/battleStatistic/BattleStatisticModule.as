package nslm2.modules.battles.battleStatistic
{
   import game.ui.statistic.StatisticPanelUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.fightPlayer.UnitVo;
   
   public class BattleStatisticModule extends StatisticPanelUI
   {
      
      public static var type:int = 0;
      
      public static var damageMax:Number;
      
      public static var hurtMax:Number;
      
      public static var healMax:Number;
       
      
      private var leftVos:Array;
      
      private var rightVos:Array;
      
      public function BattleStatisticModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         type = 0;
         damageMax = 0;
         hurtMax = 0;
         healMax = 0;
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(40200008);
         leftVos = [];
         rightVos = [];
         var _loc3_:Array = param1 as Array;
         var _loc5_:int = 0;
         var _loc4_:* = _loc3_;
         for each(var _loc2_ in _loc3_)
         {
            if(_loc2_.isAttack == 1)
            {
               leftVos.push(_loc2_);
            }
            else
            {
               rightVos.push(_loc2_);
            }
            if(_loc2_.sumDamage > damageMax)
            {
               damageMax = _loc2_.sumDamage;
            }
            if(_loc2_.sumHurt > hurtMax)
            {
               hurtMax = _loc2_.sumHurt;
            }
            if(_loc2_.sumHeal > healMax)
            {
               healMax = _loc2_.sumHeal;
            }
         }
         this.list_left.repeatY = leftVos.length;
         this.list_right.repeatY = rightVos.length;
         tab_type.labels = LocaleMgr.ins.getStr(998000396);
         this.tab_type.userChangeHandler = tabKind_change;
         tab_type.selectedIndex = 0;
         tabKind_change(0);
         if(rightVos.length >= 6)
         {
            this.height = 485;
         }
         else
         {
            this.height = 425;
         }
         super.preShow(param1);
      }
      
      private function tabKind_change(param1:int) : void
      {
         type = param1;
         this.list_left.dataSource = leftVos;
         this.list_right.dataSource = rightVos;
         switch(int(param1))
         {
            case 0:
               this.title0.text = LocaleMgr.ins.getStr(40200009);
               this.title1.text = LocaleMgr.ins.getStr(40200010);
               break;
            case 1:
               this.title0.text = LocaleMgr.ins.getStr(40200011);
               this.title1.text = LocaleMgr.ins.getStr(40200012);
               break;
            case 2:
               this.title0.text = LocaleMgr.ins.getStr(40200013);
               this.title1.text = LocaleMgr.ins.getStr(40200014);
         }
      }
   }
}
