$(function () {
  const search = instantsearch({
    appId: 'O3F8QXYK6R',
    indexName: 'meetups',
    apiKey: '6a027258345c8a569385505b041e6dec'
  });

  search.addWidget(
    instantsearch.widgets.searchBox({
      container: '#search-searchbar',
      placeholder: 'Search on this site...',
      poweredBy: true
    })
  );

  search.addWidget(
    instantsearch.widgets.hits({
      container: '#search-hits',
      transformItems: function (hits) {
        return 
      },
      templates: {
        item: $("#algolia__template").text(),
        empty: $("#algolia__template--no-results").text(),
      }
      // templates: {
      //     hits: function (hit) { 
      //       const postedAt = moment.unix(hit.date).fromNow();
      //       const title = hit._highlightResult.title.value
      //       const content = hit._highlightResult.content.value
      //       const url = hit.url;

      //       return `
      //         <div class="algolia__result">
      //           <a class="algolia__result-link" href="${url}">${title}</a>
      //           <div class="algolia__result-date">${postedAt}</div>
      //           <div class="algolia__result-text">${content}</div>
      //         </div>
      //       `
      //     }
      //   }
    })
  );

  // Starting the search
  search.start();
});
