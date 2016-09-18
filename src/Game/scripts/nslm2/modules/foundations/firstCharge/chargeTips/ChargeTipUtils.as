package nslm2.modules.foundations.firstCharge.chargeTips
{
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.bag.itemModuels.BagModel;
   import morn.core.components.Component;
   import game.ui.firstChargeModule.chargeTips.contents.ChargeTipContentUI;
   import nslm2.utils.ServerTimer;
   
   public class ChargeTipUtils
   {
      
      public static const KIND_FIRST_HERO:int = 1;
      
      public static const KIND_FIRST_HORSE:int = 2;
      
      public static const KIND_FIRST_WEAPON:int = 3;
      
      public static const KIND_SILVER_MONTH_CARD:int = 4;
      
      public static const KIND_GOLD_MONTH_CARD:int = 5;
      
      public static const KIND_VIP_4:int = 6;
      
      public static const KIND_FASHION_1:int = 7;
      
      public static const KIND_FASHION_2:int = 8;
      
      public static const LV_MAX:int = 30;
      
      private static const noShowAgainDict:Object = {};
      
      public static const FASHION_IDS_1:Array = [75110,75120,75210,75220];
      
      public static const FASHION_IDS_2:Array = [75310,75320,75410,75420];
       
      
      public function ChargeTipUtils()
      {
         super();
      }
      
      public static function getNoShowAgain(param1:int) : Boolean
      {
         if(noShowAgainDict.hasOwnProperty(param1))
         {
            return noShowAgainDict[param1];
         }
         return false;
      }
      
      public static function setNoShowAgain(param1:int) : void
      {
         noShowAgainDict[param1] = true;
      }
      
      public static function checkKind() : int
      {
         if(VipModel.ins.firstCharge == false)
         {
            if(PlayerModel.ins.level >= 6 && PlayerModel.ins.level <= 10)
            {
               return 1;
            }
            if(PlayerModel.ins.level >= 11 && PlayerModel.ins.level <= 15)
            {
               return 2;
            }
            if(PlayerModel.ins.level >= 16 && PlayerModel.ins.level <= 30)
            {
               return 3;
            }
         }
         else if(PlayerModel.ins.level >= 6 && PlayerModel.ins.level <= 30)
         {
            if(VipModel.ins.silverDay == -1)
            {
               return 4;
            }
            if(VipModel.ins.goldDay == -1)
            {
               return 5;
            }
            if(PlayerModel.ins.vip < 4)
            {
               return 6;
            }
            if(PlayerModel.ins.level >= 21 && PlayerModel.ins.level <= 30)
            {
               if(checkItemHad(FASHION_IDS_1) == false)
               {
                  return 7;
               }
            }
         }
         else if(PlayerModel.ins.level >= 31 && PlayerModel.ins.level <= 35)
         {
            if(PlayerModel.ins.vip >= 4)
            {
               if(checkItemHad(FASHION_IDS_1) == true)
               {
                  if(checkItemHad(FASHION_IDS_2) == false)
                  {
                     return 8;
                  }
               }
            }
         }
         return 0;
      }
      
      private static function checkItemHad(param1:Array) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_];
            if(BagModel.ins.getStcCount(_loc3_) > 0)
            {
               return true;
            }
            _loc4_++;
         }
         return false;
      }
      
      public static function skin_imc_char(param1:int) : String
      {
         return "png.uiChargeTips.img_char" + param1;
      }
      
      public static function skin_imc_bg(param1:int, param2:int = 0) : String
      {
         return "png.uiChargeTips.img_bg" + param1 + (param2 > 0?"_" + param2:"");
      }
      
      public static function createPage(param1:int) : Component
      {
         var _loc3_:int = 0;
         var _loc2_:ChargeTipContentUI = new ChargeTipContentUI();
         switch(int(param1) - 1)
         {
            case 0:
               _loc2_.img_bg.skin = skin_imc_bg(1);
               _loc2_.img_char.skin = skin_imc_char(2);
               break;
            case 1:
               _loc2_.img_bg.skin = skin_imc_bg(2);
               _loc2_.img_char.skin = skin_imc_char(2);
               break;
            case 2:
               _loc2_.img_bg.skin = skin_imc_bg(3);
               _loc2_.img_char.skin = skin_imc_char(2);
               break;
            case 3:
               _loc2_.img_bg.skin = skin_imc_bg(4);
               _loc2_.img_char.skin = skin_imc_char(1);
               break;
            case 4:
               _loc2_.img_bg.skin = skin_imc_bg(5);
               _loc2_.img_char.skin = skin_imc_char(1);
               break;
            case 5:
               _loc2_.img_bg.skin = skin_imc_bg(6);
               _loc2_.img_char.skin = skin_imc_char(3);
               break;
            case 6:
               _loc2_.img_bg.skin = skin_imc_bg(7,PlayerModel.ins.sex);
               _loc3_ = ServerTimer.ins.date.date;
               if(ServerTimer.ins.openServerDate == _loc3_)
               {
                  _loc2_.img_char.skin = skin_imc_char(4);
               }
               else
               {
                  _loc2_.img_char.skin = null;
               }
               break;
            case 7:
               _loc2_.img_bg.skin = skin_imc_bg(8,PlayerModel.ins.sex);
               _loc2_.img_char.skin = null;
         }
         return _loc2_;
      }
   }
}
