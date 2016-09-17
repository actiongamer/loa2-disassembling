package nslm2.modules.funnies.newYears.day51s.renders
{
   import game.ui.newYears.day51s.renders.Day51RankRenderUI;
   import nslm2.modules.funnies.funnyCommons.IFuncIdView;
   import proto.MineSweepRankInfo;
   import nslm2.modules.funnies.busyActivity.towers.services.TowerService;
   import proto.TowerRankRes.Info;
   import proto.PlayerBaseInfo;
   import nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService;
   import proto.DragonBoatRankInfo;
   import nslm2.modules.funnies.newYears.day51s.services.Day51Service;
   import proto.StaticMineSweepRankRewardModel;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.utils.WealthUtil;
   import morn.core.utils.StringUtils;
   
   public class Day51RankRender extends Day51RankRenderUI implements IFuncIdView
   {
       
      
      private var _funcId:int;
      
      private var list_gift_super_oriX:int;
      
      public function Day51RankRender()
      {
         super();
         list_gift_super_oriX = this.list_gift_super.x;
      }
      
      public function get funcId() : int
      {
         return _funcId;
      }
      
      public function set funcId(param1:int) : void
      {
         _funcId = param1;
      }
      
      public function get scoreRewardState() : MineSweepRankInfo
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc1_:* = null;
         switch(int(funcId) - 13376)
         {
            case 0:
               _loc1_ = DragonBoatService.ins.getRankInfoByScore(vo.id);
               if(_loc1_)
               {
                  _loc2_ = new MineSweepRankInfo();
                  _loc2_.player = _loc1_.player;
                  _loc2_.score = _loc1_.score;
                  return _loc2_;
               }
               return null;
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               return Day51Service.ins.getRankInfoByScore(vo.id);
            case 10:
               _loc4_ = TowerService.ins.getRankInfoByScore(vo.rank);
               if(_loc4_)
               {
                  _loc2_ = new MineSweepRankInfo();
                  _loc3_ = new PlayerBaseInfo();
                  _loc3_.id = _loc4_.id;
                  _loc3_.name = _loc4_.name;
                  _loc2_.player = _loc3_;
                  _loc2_.score = _loc4_.score;
                  return _loc2_;
               }
               return null;
         }
      }
      
      private function getHandler() : void
      {
         this.refreshUI();
      }
      
      public function get vo() : StaticMineSweepRankRewardModel
      {
         return this.dataSource as StaticMineSweepRankRewardModel;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(vo)
         {
            this.refreshUI();
         }
      }
      
      private function refreshUI() : void
      {
         var _loc1_:* = null;
         switch(int(vo.rank) - 1)
         {
            case 0:
               img_rank.visible = true;
               img_rank.skin = "png.a5.commonImgs.1ST";
               txt_rank.text = "";
               break;
            case 1:
               img_rank.visible = true;
               img_rank.skin = "png.a5.commonImgs.2ND";
               txt_rank.text = "";
               break;
            case 2:
               img_rank.visible = true;
               img_rank.skin = "png.a5.commonImgs.3RD";
               txt_rank.text = "";
         }
         if(vo.rank2 && vo.rank2 != vo.rank)
         {
            this.txt_name.text = "";
            this.txt_score.text = "";
         }
         else
         {
            _loc1_ = this.scoreRewardState;
            if(_loc1_ && _loc1_.player)
            {
               this.txt_name.text = LinkUtils.playerNameByPlayerBaseInfo(_loc1_.player);
               this.txt_score.text = _loc1_.score.toString();
            }
            else
            {
               this.txt_name.text = "";
               this.txt_score.text = "";
            }
         }
         this.list_gift.array = WealthUtil.costStrToArr(vo.reward);
         if(StringUtils.isNull(vo.superReward) == false)
         {
            this.list_gift_super.array = WealthUtil.costStrToArr(vo.superReward);
            if(this.list_gift_super.array.length == 1)
            {
               this.list_gift_super.x = list_gift_super_oriX;
            }
            else
            {
               this.list_gift_super.x = list_gift_super_oriX - 35;
            }
            this.list_gift_super.visible = true;
         }
         else
         {
            this.list_gift_super.visible = false;
         }
      }
   }
}
