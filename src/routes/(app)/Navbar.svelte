<script>
	import {
	Avatar,
		DarkMode,
		Dropdown,
		DropdownHeader,
		DropdownItem,
		NavBrand,
		NavHamburger,
		NavLi,
		NavUl,
		Navbar,
	} from 'flowbite-svelte';
	import { ChevronDownOutline } from 'flowbite-svelte-icons';
	import '../../app.css';
	import imgLogo from '$lib/assets/images/logo.png';
	import { faUserFriends, faBuilding, faSignOutAlt } from '@fortawesome/free-solid-svg-icons';
	import Fa from 'svelte-fa';

export let org_name = 'BottleCRM';
export let fluid = true;
export let drawerHidden = false;
export let list = false;
export let name = 'Neil Sims';
export let email = "";
export let userPic = '';
</script>

<Navbar {fluid} class="text-black" color="default" let:NavContainer>
	<NavHamburger
		onClick={() => (drawerHidden = !drawerHidden)}
		class="m-0 me-3 md:block lg:hidden"
	/>
<NavBrand href="/" class={list ? 'w-40' : 'lg:w-60'}>
    <img src={imgLogo} class="me-2.5 h-6 sm:h-8" alt="BottleCRM" />
    <span
        class="ml-px self-center text-xl font-semibold whitespace-nowrap sm:text-2xl dark:text-white"
    >
        {org_name}
    </span>
</NavBrand>
	<div class="hidden lg:block lg:ps-3">
		{#if list}
			<NavUl class="ml-2" activeUrl="/" activeClass="text-primary-600 dark:text-primary-500">
				<NavLi href="/">Home</NavLi>
				<NavLi href="#top">Messages</NavLi>
				<NavLi href="#top">Profile</NavLi>
				<NavLi href="#top">Settings</NavLi>
				<NavLi class="cursor-pointer">
					Dropdown
					<ChevronDownOutline class="ms-0 inline" />
				</NavLi>
				<Dropdown class="z-20 w-44">
					<DropdownItem href="#top">Item 1</DropdownItem>
					<DropdownItem href="#top">Item 2</DropdownItem>
					<DropdownItem href="#top">Item 3</DropdownItem>
				</Dropdown>
			</NavUl>
		{:else}
			&nbsp;
		{/if}
	</div>
	<div class="ms-auto flex items-center text-gray-500 sm:order-2 dark:text-gray-400">
		<!-- <Notifications />
		<AppsMenu /> -->
		<DarkMode />
		<!-- <UserMenu {...Users[4]} /> -->

		<button class="ms-3 rounded-full ring-gray-400 focus:ring-4 dark:ring-gray-600">
			<Avatar size="sm" src={userPic} tabindex={0} />
		</button>
		<Dropdown placement="bottom-end" class="min-w-[220px] shadow-lg rounded-lg border border-gray-100 dark:border-gray-700">
			<DropdownHeader class="pb-2 border-b border-gray-100 dark:border-gray-700 mb-2">
				<span class="block text-base font-semibold text-gray-900 dark:text-white">{name}</span>
				<span class="block truncate text-sm font-medium text-gray-500 dark:text-gray-400">{email}</span>
			</DropdownHeader>
			<DropdownItem href="/app/users" class="flex items-center gap-2">
				<Fa icon={faUserFriends} class="w-4 h-4 text-gray-400" />
				Users
			</DropdownItem>
			<DropdownItem href="/org" class="flex items-center gap-2">
				<Fa icon={faBuilding} class="w-4 h-4 text-gray-400" />
				All Organizations
			</DropdownItem>
			<div class="my-2 border-t border-gray-100 dark:border-gray-700"></div>
			<DropdownItem href="/logout" class="flex items-center gap-2 text-red-600 dark:text-red-400">
				<Fa icon={faSignOutAlt} class="w-4 h-4" />
				Sign out
			</DropdownItem>
		</Dropdown>
	</div>
</Navbar>
