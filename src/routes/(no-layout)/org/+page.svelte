<script>
    import '../../../app.css'
    import { SpeedDial, SpeedDialButton, Card, Button } from 'flowbite-svelte';
    import { BuildingSolid } from 'flowbite-svelte-icons';
    import { Fa } from 'svelte-fa';
    import { faCog, faSignOutAlt } from '@fortawesome/free-solid-svg-icons';
    import { goto } from '$app/navigation';
    import { browser } from '$app/environment';
    
    // Get the data from the server load function
    export let data;
    const { orgs } = data;
    
    // Function to handle organization selection
    function selectOrg(org) {
        if (browser) {
            // Set both org id and org name in cookies
            document.cookie = `org=${org.id}; path=/; SameSite=Strict`;
            document.cookie = `org_name=${encodeURIComponent(org.name)}; path=/; SameSite=Strict`;

            // Redirect to homepage
            goto('/app');
        }
    }
</script>

<div class="relative p-4 max-w-4xl mx-auto">
     <!-- Logout Icon Top Right -->
    <div class="absolute top-4 right-4 z-10">
        <a href="/logout" title="Logout" class="text-gray-500 hover:text-red-600 transition">
            <Fa icon={faSignOutAlt} class="w-6 h-6" /> Logout
        </a>
    </div>
    <h1 class="text-2xl font-bold mb-6">Select an Organization</h1>
    
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        {#each orgs as org}
            <Card padding="lg" class="cursor-pointer hover:shadow-lg transition-shadow" on:click={() => selectOrg(org)}>
                <div class="flex items-center space-x-3">
                    <div class="p-2 bg-blue-100 rounded-lg">
                        <BuildingSolid class="text-blue-600 w-6 h-6" />
                    </div>
                    <div class="flex items-center gap-2">
                        <h5 class="text-lg font-semibold text-gray-900">{org.name}</h5>
                        {#if org.role === 'ADMIN'}
                            <a href={`/org/${org.id}`} title="Organization Settings" on:click|stopPropagation>
                                <Fa icon={faCog} class="text-gray-500 hover:text-blue-600 w-5 h-5 ml-1" />
                            </a>
                        {/if}
                    </div>
                </div>
                <Button color="blue" class="w-full mt-3">Select</Button>
            </Card>
        {/each}
    </div>
    
    {#if orgs.length === 0}
        <div class="text-center p-8 bg-gray-50 rounded-lg">
            <p class="text-gray-500">No organizations found. Create a new one!</p>
        </div>
    {/if}

   
</div>

<SpeedDial href="/org/new" defaultClass="absolute end-6 bottom-6 z-50 bg-red-500">
    <SpeedDialButton name="Create New Organization" />
</SpeedDial>