import "bootstrap";
import { activeLink } from '../components/active_navlink';
import { animateHomeContentTabs } from "../components/home_concept_tabs.js";
import { animateFlashes } from '../components/animate_flashes';
import { initModal } from '../components/init_modal';
import { loadDynamicBannerText } from '../components/banner';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { initLightGallery } from '../components/init_lightgallery';
import { readMore } from '../components/worker_read_more';
import {hideSubmit} from '../components/submit_incident';
import {hideSubmitAnswers} from '../components/submit_incident';
import { sweetAlert } from '../components/init_sweetalert';


animateHomeContentTabs()
activeLink();
animateFlashes();
initModal();
loadDynamicBannerText();
initUpdateNavbarOnScroll();
initLightGallery();
readMore();
hideSubmit();
hideSubmitAnswers();
// Activate a WARNIG sweetAlert before to pay a rent
sweetAlert('.btn-pay-rent');
